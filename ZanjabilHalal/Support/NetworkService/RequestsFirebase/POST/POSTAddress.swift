//
//  POSTAddress.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Combine
import Foundation

public final class POSTAddress {
    
    private var abstractFactory  = URLAbstractFactory()
    private var urlBody          = URLBody()
    private let internetСheck    = InternetСheckService()
    private var cancelable       : Set<AnyCancellable> = []
    
    public func request(data: Any? = nil, completionRequest: @escaping Closure<RequestResult>) {
        //1 - проверка наличия интернета
        guard self.internetСheck.check() else {
            completionRequest(.error(RequestFirebaseError.invalidInternet))
            return }
        //2 - Создание URL
        let body       = data as! ENCAddress
        let collection = self.abstractFactory.create(with: URLFirebaseAddress())?.url
        
        //3 - Отправка данных
        do {
            let _ = try collection?.document(body.ID).setData(from: body)
            completionRequest(.object(true))
        } catch let error {
            print(error.localizedDescription)
            completionRequest(.object(false))
        }
    }
}
