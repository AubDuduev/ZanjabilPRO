//
//
//  LocationService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.05.2022.
//
//
import MapKit
import CoreLocation
import Foundation

final class LocationService: NSObject, ServiceProtocol {
	
	private let locationManager = CLLocationManager()
	
	public var didUpdateLocations: Closure<CLLocationCoordinate2D>!
	public var returnResponseUser: Closure<Bool>!
	
	public func getUserLocation(){
		self.locationManager.startUpdatingLocation()
	}
	public func stopUserLocation(){
		self.locationManager.stopUpdatingLocation()
	}
	
	public func isState() -> Bool {
		switch CLLocationManager.authorizationStatus() {
				//Не запрашивали
			case .notDetermined:
				print("notDetermined")
				return false
				//Oграниченный
			case .restricted:
				print("restricted")
				return true
				//Отклонил
			case .denied:
				print("denied")
				return false
				//Доступен всегда
			case .authorizedAlways:
				self.getUserLocation()
				print("authorizedAlways")
				return true
				//Доступен при использовании
			case .authorizedWhenInUse:
				self.getUserLocation()
				print("authorizedWhenInUse")
				return true
			@unknown default:
				print("unknown")
				return false
		}
	}
	public func authorisation(){
		switch CLLocationManager.authorizationStatus() {
				//Не запрашивали
			case .notDetermined:
				print("notDetermined")
				self.locationManager.requestWhenInUseAuthorization()
				self.returnResponseUser?(false)
				//Oграниченный
			case .restricted:
				self.locationManager.requestWhenInUseAuthorization()
				print("restricted")
				self.returnResponseUser?(false)
				//Отклонил
			case .denied:
//				AlertApple.shared.options(title: .information, message: .isFailureLocation, options: .Settings) { (responseIndex) in
//					switch responseIndex {
//						case 0:
//							OpenURL.shared.openSetting(app: .Setting)
//						case 1:
//							self.returnResponseUser?(false)
//						default:
//							break
//					}
//				}
				print("")
				//Доступен всегда
			case .authorizedAlways:
				self.getUserLocation()
				print("authorizedAlways")
				self.returnResponseUser?(true)
				//Доступен при использовании
			case .authorizedWhenInUse:
				self.getUserLocation()
				print("authorizedWhenInUse")
				self.returnResponseUser?(true)
			@unknown default:
				print("unknown")
		}
	}
	
	public func setup(){
		self.locationManager.delegate = self
	}
}

extension LocationService: CLLocationManagerDelegate {
	
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		guard !self.isState() else { return }
		self.authorisation()
	}
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		let userLocation = locations.last!
		self.didUpdateLocations?(userLocation.coordinate)
	}
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Ошибка получение текущей геопозиции", error.localizedDescription)
	}
}
