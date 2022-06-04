//
//  POSTAddressSuggestion.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 28.05.2022.
//
import Combine
import Foundation

public final class POSTAddressSuggestion: SessionProtocol {
	
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
		let parameters = data as! ENCAddressSuggestion
		let body       = self.urlBody.create(with: .addressSuggestion(parameters))
		let urlObject  = URLAddressSuggestion()
		let url        = self.abstractFactory.create(urlObject)?.URL
		let header     = self.headers.create(type: .authorization_appJson(.Token, .daData))
		//3 - Geting data
		self.group.enter()
		self.session(url: url, body: body, httpMethod: .post, header: header) { sessionResult in
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
			self.decoderService.decode(jsonType: DECAddressSuggestions.self, data: self.sessionData) { (decodeResult) in
				switch decodeResult {
					// Error
					case .error(let error):
						completionRequest(.error(error))
					// Success
					case .json(let object):
						if let decAddressSuggestions = object as? DECAddressSuggestions {
							completionRequest(.object(decAddressSuggestions))
						}
				}
			}
		}
	}
}
