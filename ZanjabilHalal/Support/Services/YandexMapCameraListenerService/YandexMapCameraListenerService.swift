//
//
//  YandexMapCameraListenerService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
//
import YandexMapsMobile
import Foundation
import Combine
import Resolver
import CoreLocation

final class YandexMapCameraListenerService: NSObject, ServiceProtocol, YMKMapCameraListener {
	
	@Injected
	private var requestsRESTService: RequestsRESTService
	@Injected
	private var delayTaskService   : DelayTaskService
	
	public var completionAddress = PassthroughSubject<DECYandexGEOObject, Never>()
	
	private func getYandexReverseGeocoding(with coordinate: YMKPoint){
		let parameters = self.createParametersYandexReverseGeocoding(with: coordinate)
		self.requestsRESTService.getYandexReverseGeocoding(with: parameters) { yandexGEOObject in
			guard let yandexGEOObject = yandexGEOObject else { return }
			self.completionAddress.send(yandexGEOObject)
		}
	}
	
	private func createParametersYandexReverseGeocoding(with coordinate: YMKPoint) -> ParametersYandexReverseGeocoding {
		let geocode    = "\(coordinate.longitude),\(coordinate.latitude)"
		let parameters = ParametersYandexReverseGeocoding(geocode: geocode)
		return parameters
	}
	
	func onCameraPositionChanged(with map: YMKMap, cameraPosition: YMKCameraPosition, cameraUpdateReason: YMKCameraUpdateReason, finished: Bool) {
		self.delayTaskService.deleteAfter(seconds: 1)
		self.delayTaskService.execute = { [weak self] in
			guard let self = self else { return }
			self.getYandexReverseGeocoding(with: cameraPosition.target)
		}
		print("---▼---", "debug")
		print(cameraPosition.target.latitude)
		print(cameraPosition.target.longitude)
		print("---▲---", "debug")
	}
}

