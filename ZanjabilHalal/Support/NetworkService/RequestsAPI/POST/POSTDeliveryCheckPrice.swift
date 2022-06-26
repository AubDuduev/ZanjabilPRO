//
//  POSTDeliveryCheckPrice.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation
import Combine
//Getting prepay delivery price
//https://b2b.taxi.yandex.net/b2b/cargo/integration/v1/check-price
public final class POSTDeliveryCheckPrice: SessionProtocol {
	
	private var abstractFactory = URLAbstractFactory()
	private var headers         = URLHeaders()
	private var urlBody         = URLBody()
	private let internetСheck   = InternetСheckService()
	private var groupSession    = DispatchGroup()
	private var sessionData     : Data!
	private let decoderService  = JSONDecoderService()
	
	public func request(data: Any?, completionRequest: @escaping Closure<RequestResult>) {
		//1 - Testing internet
		guard self.internetСheck.check() else { return }
		//2 - Creating URL, Header, Body, Parameters
		let deliveryCheckPrice = data as! ENCDeliveryCheckPrice
		let body               = self.urlBody.create(with: .deliveryCheckPrice(deliveryCheckPrice))
		let urlObject          = URLYandexCheckPrice()
		let url                = self.abstractFactory.create(urlObject)?.URL
		let header             = self.headers.create(with: .authorization_appJson(.Bearer, .yandexDelivery))
		//3 - Geting data
		self.groupSession.enter()
		session(url: url, body: body, httpMethod: .post, header: header) { sessionResult in
			switch sessionResult {
					//Error
				case .error(let error):
					print(error!.localizedDescription, "Error JSONDecode get from Server URLYandexCheckPrice")
					print(#function, #line, #file)
					//Success
				case .data(let data):
					self.sessionData = data
					print(String(data: data, encoding: .utf8)!)
					print(#function, #line, #file)
					self.groupSession.leave()
			}
		}
		//4 - Decoding
		self.groupSession.notify(queue: .main) {
			self.decoderService.decode(jsonType: DECDeliveryCheckPrice.self, data: self.sessionData) { (decodeResult) in
				switch decodeResult {
						// Error
					case .error(let error):
						completionRequest(.error(error))
						// Success
					case .json(let object):
						if let decAddressSuggestions = object as? DECDeliveryCheckPrice {
							completionRequest(.object(decAddressSuggestions))
						}
				}
			}
		}
	}
	public init(){}
}
