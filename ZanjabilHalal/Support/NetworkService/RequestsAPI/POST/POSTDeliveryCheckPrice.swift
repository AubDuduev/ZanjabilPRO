//
//  POSTDeliveryCheckPrice.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation
import Combine
//<#Description#>
//<#NAME#>
public final class POSTDeliveryCheckPrice: Requestoble, Sessionoble {
   
	private var abstractFactory = URLAbstractFactory()
	private var headers         = URLHeaders()
	private var urlBody         = URLBody()
	private let internetСheck   = InternetСheckService()
	private var group           = DispatchGroup()
	private var sessionData     : Data!
	private let decoderService  = JSONDecoderService()
   
   public func request(data: Any?, completionRequest: @escaping Closure<Decodable?>) {
	   //1 - Testing internet
      guard self.internetTest.test() else { return }
	   //2 - Creating URL, Header, Body, Parameters
      let parameters = data as! <#Parameters#>
      let body       = self.urlBody.create(with: <#NAME#>)
      let urlObject  = <#NAME#>
      let url        = self.abstractFactory.create(urlObject, dataForUrl: <#dataForUrl#>)?.URL
      let header     = self.headers.create(with: <#NAME#>)
	   //3 - Geting data
      self.groupSession.enter()
      session(url: url, httpMethod: <#NAME#>, header: header) { sessionResult in
         switch sessionResult {
            //Error
            case .error(let error):
               print(error!.localizedDescription, "Error JSONDecode get from Server <#название запроса#>")
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
         self.jsonDecode.decode(jsonType: <#DECODABLE#>.self, data: self.sessionData) { (decodeResult) in
            if let  = decodeResult as? <#DECODABLE#> {
               completionRequest()
            } else {
               completionRequest(nil)
            }
         }
      }
   }
   public init(){}
}
