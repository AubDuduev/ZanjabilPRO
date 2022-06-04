//
//  POSTOrder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.04.2022.
//
import Combine
import Foundation

public final class POSTOrder {
    
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
        let body       = data as! ENCOrder
        let collection = self.abstractFactory.create(with: URLFirebaseOrders())?.url
        
        //3 - Отправка данных
        do {
            let _ = try collection?.addDocument(from: body)
            completionRequest(.object(true))
        } catch let error {
            print(error.localizedDescription)
            completionRequest(.object(false))
        }
    }
}
