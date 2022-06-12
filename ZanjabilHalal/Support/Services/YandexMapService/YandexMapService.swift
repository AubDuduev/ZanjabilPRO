//
//  YandexMapService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.05.2022.
//
import Combine
import CoreLocation
import Resolver
//import YandexMapsMobile
import Foundation

final class YandexMapService: ServiceProtocol {
    
    private let apiKey = "6aa10602-86e0-44f2-ac8b-7df843a57bf4"
	
	// MARK: - DI
	@Injected
	private var locationService: LocationService
	// MARK: - Public
	public var completionAddress        = PassthroughSubject<String, Never>()
	public var completionCoordinate     = PassthroughSubject<CLLocationCoordinate2D, Never>()
	//public var completionCameraPosition = PassthroughSubject<YMKCameraPosition, Never>()
	
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
//		let target = YMKPoint(latitude : coordinate.latitude,
//							  longitude: coordinate.longitude)
//		let zoom   : Float = 15
//		let azimuth: Float = 0
//		let tilt   : Float = 0
//		let cameraPosition = YMKCameraPosition(target: target,
//											   zoom: zoom,
//											   azimuth: azimuth,
//											   tilt: tilt)
		//self.completionCameraPosition.send(cameraPosition)
	}

	
    public func activate(){
        //YMKMapKit.setApiKey(self.apiKey)
		//YMKMapKit.sharedInstance().onStart()
    }
}

