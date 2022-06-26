//
//  DELETEAddress.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 02.05.2022.
//
import Combine
import Foundation

public final class DELETEAddress {
    
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
        let address    = data as! ENCAddress
        let collection = self.abstractFactory.create(with: URLFirebaseAddress())?.url
        
        //3 - Отправка данных
        collection?.document(address.ID).delete() { error in
            if let error = error {
                print(error.localizedDescription)
                completionRequest(.object(false))
            } else {
                completionRequest(.object(true))
            }
        }
    }
}
