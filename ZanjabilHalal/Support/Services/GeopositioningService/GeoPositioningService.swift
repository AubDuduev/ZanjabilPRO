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
	private var locationService    : LocationService
	@Injected
	private var mapKitService      : MapKitService
	@Injected
	private var requestsRESTService: RequestsRESTService
	// MARK: - Public
	public var completionSuggestionsAddress = PassthroughSubject<DECAddressSuggestion, Never>()
	public var completionUserCoordinate     = PassthroughSubject<CLLocationCoordinate2D, Never>()
	public var completionRegionCoordinate   = PassthroughSubject<CLLocationCoordinate2D, Never>()
	public var completionMapCamera          = PassthroughSubject<MKMapCamera, Never>()
	public var completionRegionChange       = PassthroughSubject<RegionChange, Never>()
	
	private var addressSuggestion: DECAddressSuggestion?
	
	public func setupLocationService() {
		self.locationService.setup()
		self.locationService.authorisation()
		self.locationService.didUpdateLocations = { [weak self] coordinate in
			guard let self = self else { return }
			self.createMapCamera(with: coordinate)
			self.completionUserCoordinate.send(coordinate)
			self.postReverseGeocoding(with: coordinate)
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
			self.postReverseGeocoding(with: coordinate)
		}
	}
	
	public func setCoordinate(with coordinate: CLLocationCoordinate2D) {
		self.createMapCamera(with: coordinate)
	}
	
	public func saveAddressSuggestion(with addressSuggestion: DECAddressSuggestion){
		self.addressSuggestion = addressSuggestion
	}
	
	public func getAddressSuggestion() -> DECAddressSuggestion? {
		return self.addressSuggestion
	}
	
	public func stopUserLocation(){
		self.locationService.stopUserLocation()
	}
	
	public func startUserLocation(){
		self.locationService.getUserLocation()
	}
	
	private func createMapCamera(with coordinate: CLLocationCoordinate2D) {
		let distance     = "500"
		let eyeAltitude  = CLLocationDistance(distance)!
		let mapCamera    = MKMapCamera(lookingAtCenter  : coordinate,
									   fromEyeCoordinate: coordinate,
									   eyeAltitude      : eyeAltitude)
		self.completionMapCamera.send(mapCamera)
	}
	
	private func postReverseGeocoding(with coordinate: CLLocationCoordinate2D) {
		guard let encCoordinate = self.createEncCoordinates(with: coordinate) else { return }
		self.requestsRESTService.postReverseGeocoding(with: encCoordinate) { suggestionsAddresses in
			guard let suggestionsAddress = suggestionsAddresses?.last else { return }
			self.completionSuggestionsAddress.send(suggestionsAddress)
		}
	}
	private func createEncCoordinates(with coordinates: CLLocationCoordinate2D) -> ENCCoordinate? {
		let latitude   = coordinates.latitude
		let longitude  = coordinates.longitude
		let coordinate = ENCCoordinate(lat: latitude, lon: longitude, count: 5)
		return coordinate
	}
	
}

struct GeoPositioningAddress {
	
	
}
