//
//  MapService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 31.05.2022.
//
import Combine
import CoreLocation
import Resolver
import UIKit
import MapKit

final class MapKitService: NSObject, ServiceProtocol {
	// MARK: - DI
	@Injected
	private var locationService: LocationService
	// MARK: - Public
	public var completionAddress       = PassthroughSubject<String, Never>()
	public var completionCoordinate    = PassthroughSubject<CLLocationCoordinate2D, Never>()
	public var completionMapCoordinate = PassthroughSubject<CLLocationCoordinate2D, Never>()
	public var completionChangeUserGeo = PassthroughSubject<MKMapCamera, Never>()
	
	public var completionRegionChange: Closure<Bool>?
	
	public func setupLocationService() {
		self.locationService.setup()
		self.locationService.authorisation()
		self.locationService.didUpdateLocations = { [weak self] coordinate in
			guard let self = self else { return }
			self.updateViewCoordinate(with: coordinate)
			self.updateAddress(with: coordinate)
			self.completionCoordinate.send(coordinate)
		}
	}
	
	public func stopUserLocation(){
		self.locationService.stopUserLocation()
	}
	
	public func startUserLocation(){
		self.locationService.getUserLocation()
	}
	
	private func updateAddress(with coordinate: CLLocationCoordinate2D) {
		let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
		location.fetchAddress { [weak self] currentAddress, error in
			guard let self = self else { return }
			guard let currentAddress = currentAddress else { return }
			self.completionAddress.send(currentAddress)
		}
	}
	
	private func updateViewCoordinate(with coordinate: CLLocationCoordinate2D) {
		let distance     = "800"
		let eyeAltitude  = CLLocationDistance(distance)!
		let mapCamera    = MKMapCamera(lookingAtCenter  : coordinate,
									   fromEyeCoordinate: coordinate,
									   eyeAltitude      : eyeAltitude)
		self.completionChangeUserGeo.send(mapCamera)
	}
}

extension MapKitService: MKMapViewDelegate {
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "user")
		//		annotationView.backgroundColor = .red
		//		annotationView.frame.size = CGSize(width: 15, height: 15)
		//		annotationView.cornerRadius(7.5, false)
		//		annotationView.shadowColor(color: .black, radius: 10, opacity: 0.2)
		//		annotationView.borderColor(.black, 1)
		return annotationView
	}
	
	func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
		//загрузку начинаем
		self.completionRegionChange?(true)
	}
	func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
		//загрузку заканчиваем
		self.completionRegionChange?(false)
	}
	
	func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
		//загрузку заканчиваем
		//self.viewModel.mapModel = .loadingGetPosition(true)
	}
	//	func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
	//		return self.viewModel.managers.logic.createPolygon(overlay: overlay)
	//	}
	
}
