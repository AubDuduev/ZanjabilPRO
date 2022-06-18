//
//  GETYandexReverseGeocoding.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Combine
import Foundation

public final class GETYandexReverseGeocoding: SessionProtocol {
	
	private var abstractFactory = URLAbstractFactory()
	private var headers         = URLHeaders()
	private var urlBody         = URLBody()
	private let internetСheck   = InternetСheckService()
	private var group           = DispatchGroup()
	private var sessionData     : Data!
	private let decoderService  = JSONDecoderService()
	
	public func request(data: Any?, completionRequest: @escaping Closure<RequestResult>) {
		//1 - Testing internet
		guard self.internetСheck.check() else { return }
		//2 - Creating URL, Header, Body, Parameters
		let parameters = data as! ParametersYandexReverseGeocoding
		let urlObject  = URLYandexReverseGeocoding()
		let url        = self.abstractFactory.create(urlObject, dataForUrl: parameters)?.URL
		let header     = self.headers.create(type: .authorization_appJson(.Token, .daData))
		//3 - Geting data
		self.group.enter()
		self.session(url: url, httpMethod: .get, header: header) { sessionResult in
			switch sessionResult {
					// Success
				case .data(let data):
					self.sessionData = data
					self.group.leave()
					// Error
				case .error(let error):
					print(error!.localizedDescription, "Error JSONDecode get from Server")
					completionRequest(.error(error))
					self.group.leave()
			}
		}
		//4 - Decoding
		self.group.notify(queue: .main) {
			self.decoderService.decode(jsonType: DECYandexReverseGeocoding.self, data: self.sessionData) { (decodeResult) in
				switch decodeResult {
						// Error
					case .error(let error):
						completionRequest(.error(error))
						// Success
					case .json(let object):
						if let yandexReverseGeocoding = object as? DECYandexReverseGeocoding {
							completionRequest(.object(yandexReverseGeocoding))
						}
				}
			}
		}
	}
}

