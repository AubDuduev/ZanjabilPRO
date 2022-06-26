//
//
//  YandexDeliveryService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
//
import Resolver
import Combine
import Foundation

final class YandexDeliveryService: ServiceProtocol {
  
	// MARK: - DI
	@Injected
	private var requestsRESTService: RequestsRESTService
	@Injected
	private var addressesService   : AddressesService
	// MARK: - Private
	private var cancelable    : Set<AnyCancellable> = []
	private var defaultAddress: DECAddress?
	private var addresses     : [DECAddress]!
	// MARK: - Public
	public var completionPrice = PassthroughSubject<String, Never>()
	
	public func getPrice(){
		let addressGroup  = DispatchGroup()
		self.addressesService.subscribeUpdate
			.sink { addresses in
				addressGroup.enter()
				self.addresses      = addresses
				self.defaultAddress = addresses.first(where: { $0.isDefault })
				addressGroup.leave()
			}
			.store(in: &cancelable)
		addressGroup.notify(queue: .main) {
			guard let deliveryCheckPrice = self.createDeliveryCheckPrice() else { return }
			self.requestsRESTService.postDeliveryCheckPrice(with: deliveryCheckPrice) { deliveryCheckPrice in
				guard let price = deliveryCheckPrice?.price else { return }
				self.completionPrice.send(price)
			}
		}
	}
	
	private func createDeliveryCheckPrice() -> ENCDeliveryCheckPrice? {
		guard let latitude  = self.defaultAddress?.latitude.toDouble()  else { return nil }
		guard let longitude = self.defaultAddress?.longitude.toDouble() else { return nil }
		let routePointTo    = CODRoutePoint(coordinates: [30.349361, 59.912006])
		let routePointFrom  = CODRoutePoint(coordinates: [latitude, longitude])
		let routePoints     = [routePointFrom, routePointTo]
		let sendPackageSize = CODSendPackageSize(height: 0.1,
												 length: 0.1,
												 width : 0.1)
		let sendPackage     = CODSendPackage(quantity: 1,
											 weight  : 1,
											 size    : sendPackageSize)
		let cargoOptions: [YandexCargoOptions] = [.thermoBag, .autoCourier]
		let cargoType   : YandexCargoType      = .middle
		let taxiClass   : YandexTaxiClass      = .express
		let clientRequirements = CODClientRequirements(assignRobot : false,
													   cargoLoaders: 0,
													   cargoOptions: cargoOptions.map({ $0.rawValue }),
													   cargoType   : cargoType.rawValue,
													   proCourier  : false,
													   taxiClass   : taxiClass.rawValue)
		let deliveryCheckPrice = ENCDeliveryCheckPrice(sendPackages      : [sendPackage],
													   clientRequirements: clientRequirements,
													   routePoints       : routePoints,
													   skipDoorToDoor    : false)
		return deliveryCheckPrice
	}
}
