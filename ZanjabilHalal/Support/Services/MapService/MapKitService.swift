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

final class MapKitService: NSObject, ServiceProtocol, MKMapViewDelegate {
	
	public var regionWillChangeAnimated  : ClosureEmpty?
	public var regionDidChangeAnimated   : ClosureEmpty?
	public var completionRegionCoordinate: Closure<CLLocationCoordinate2D>?
	
	
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
		self.regionWillChangeAnimated?()
	}
	func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
		//загрузку заканчиваем
		self.regionDidChangeAnimated?()
		self.completionRegionCoordinate?(mapView.centerCoordinate)
	}
	
	func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
		//загрузку заканчиваем
		//self.viewModel.mapModel = .loadingGetPosition(true)
	}
	
//	func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//		return self.viewModel.managers.logic.createPolygon(overlay: overlay)
//	}
//
	private func createCoordinate(with mapView: MKMapView) -> CLLocationCoordinate2D {
		let coordinate = mapView.centerCoordinate
		return coordinate
	}
}

