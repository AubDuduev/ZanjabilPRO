//
//  MapService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 31.05.2022.
//
import Combine
import CoreLocation
import Resolver
import Foundation
import MapKit

final class MapService: ServiceProtocol {
	
	// MARK: - DI
	@Injected
	private var locationService: LocationService
	// MARK: - Public
	public var completionAddress    = PassthroughSubject<String, Never>()
	public var completionCoordinate = PassthroughSubject<CLLocationCoordinate2D, Never>()
	public var completionMapCamera  = PassthroughSubject<MKMapCamera, Never>()
	
	public func setupLocationService() {
		self.locationService.setup()
		self.locationService.authorisation()
		self.locationService.returnLocationUser = { [weak self] coordinate in
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
		self.completionMapCamera.send(mapCamera)
	}
}

