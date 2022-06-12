//
//  GeoPositioningService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 12.06.2022.
//
import Resolver
import Combine
import CoreLocation
import Foundation
import MapKit

final class GeoPositioningService {
	// MARK: - DI
	@Injected
	private var locationService: LocationService
	@Injected
	private var mapKitService  : MapKitService
	// MARK: - Public
	public var completionAddress          = PassthroughSubject<String, Never>()
	public var completionUserCoordinate   = PassthroughSubject<CLLocationCoordinate2D, Never>()
	public var completionRegionCoordinate = PassthroughSubject<CLLocationCoordinate2D, Never>()
	public var completionMapCamera        = PassthroughSubject<MKMapCamera, Never>()
	public var completionRegionChange     = PassthroughSubject<RegionChange, Never>()
	
	public func setupLocationService() {
		self.locationService.setup()
		self.locationService.authorisation()
		self.locationService.didUpdateLocations = { [weak self] coordinate in
			guard let self = self else { return }
			self.createMapCamera(with: coordinate)
			self.createAddress(with: coordinate)
			self.completionUserCoordinate.send(coordinate)
		}
	}
	
	public func setupMapKitService() {
		self.mapKitService.regionWillChangeAnimated = { [weak self] in
			guard let self = self else { return }
			self.completionRegionChange.send(.start)
		}
		
		self.mapKitService.regionDidChangeAnimated = { [weak self] in
			guard let self = self else { return }
			self.completionRegionChange.send(.finish)
		}
		
		self.mapKitService.completionRegionCoordinate = { [weak self] coordinate in
			guard let self = self else { return }
			self.completionRegionCoordinate.send(coordinate)
			self.createAddress(with: coordinate)
		}
	}
	
	public func setCoordinate(with coordinate: CLLocationCoordinate2D) {
		self.createMapCamera(with: coordinate)
	}
	
	public func stopUserLocation(){
		self.locationService.stopUserLocation()
	}
	
	public func startUserLocation(){
		self.locationService.getUserLocation()
	}
	
	private func createAddress(with coordinate: CLLocationCoordinate2D) {
		let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
		location.fetchAddress { [weak self] currentAddress, error in
			guard let self = self else { return }
			guard let currentAddress = currentAddress else { return }
			self.completionAddress.send(currentAddress)
		}
	}
	
	private func createMapCamera(with coordinate: CLLocationCoordinate2D) {
		let distance     = "800"
		let eyeAltitude  = CLLocationDistance(distance)!
		let mapCamera    = MKMapCamera(lookingAtCenter  : coordinate,
									   fromEyeCoordinate: coordinate,
									   eyeAltitude      : eyeAltitude)
		self.completionMapCamera.send(mapCamera)
	}
}

