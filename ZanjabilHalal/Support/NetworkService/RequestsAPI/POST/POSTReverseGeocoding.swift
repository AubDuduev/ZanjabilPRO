//
//  POSTReverseGeocoding.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 11.06.2022.
//
import Combine
import Foundation

public final class POSTReverseGeocoding: SessionProtocol {
	
	private var abstractFactory = URLAbstractFactory()
	private var headers         = URLHeaders()
	private var urlBody         = URLBody()
	private let internetСheck   = InternetСheckService()
	private var groupSession     = DispatchGroup()
	private var sessionData     : Data!
	private let decoderService  = JSONDecoderService()
	
	public func request(data: Any?, completionRequest: @escaping Closure<RequestResult>) {
		//1 - Testing internet
		guard self.internetСheck.check() else { return }
		//2 - Creating URL, Header, Body, Parameters
		let parameters = data as! ENCCoordinate
		let body       = self.urlBody.create(with: .coordinate(parameters))
		let urlObject  = URLReverseGeocoding()
		let url        = self.abstractFactory.create(urlObject)?.URL
		let header     = self.headers.create(with: .authorization_appJson(.Token, .daData))
		//3 - Geting data
		self.groupSession.enter()
		self.session(url: url, body: body, httpMethod: .post, header: header) { sessionResult in
			switch sessionResult {
					// Success
				case .data(let data):
					self.sessionData = data
					self.groupSession.leave()
					// Error
				case .error(let error):
					print(error!.localizedDescription, "Error JSONDecode get from Server")
					completionRequest(.error(error))
					self.groupSession.leave()
			}
		}
		//4 - Decoding
		self.groupSession.notify(queue: .main) {
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
