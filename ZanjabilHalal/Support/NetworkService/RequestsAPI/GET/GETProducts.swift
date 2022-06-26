//
//  GETProducts.swift
//  Network
//
//  Created by Senior Developer on 12.03.2022.
//
import Combine
import Foundation

public final class GETProducts: SessionProtocol {
    
    private var abstractFactory  = URLAbstractFactory()
    private var headers          = URLHeaders()
    private var urlBody          = URLBody()
    private let internetСheck    = InternetСheckService()
    private var cancelable       : Set<AnyCancellable> = []
    
    public func request(data: Any?, completionRequest: @escaping Closure<RequestResult>) {
        //1 - проверка наличия интернета
        guard self.internetСheck.check() else { return }
        //2 - Создание URL, Header, Body, Parameters
        let parameters = data as! ENCProduct
        let parameter  = data as! String
        let body       = self.urlBody.create(with: .default(parameters))
        let url        = self.abstractFactory.create(URLProduct(), dataForUrl: parameter)?.URL
        let header     = self.headers.create(with: .appJson)
        //3 - Получение данных
        do {
            try session(url: url, body: body, httpMethod: .get, header: header)
                .decode(type: DECProduct.self, decoder: JSONDecoder())
                .sink { completionError in
                    switch completionError {
                        case .failure(let error):
                            completionRequest(.error(error))
                        default:
                            break
                    }
                } receiveValue: { jsonObject in
                    completionRequest(.object(jsonObject))
                }
                .store(in: &self.cancelable)
            
        } catch let error {
            completionRequest(.error(error))
        }
    }
}
