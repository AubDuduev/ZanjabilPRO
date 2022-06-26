//
//  GETAddresses.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 30.04.2022.
//
import Combine
import Foundation

public final class GETAddresses {
    
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
        let collection = self.abstractFactory.create(with: URLFirebaseAddress())?.url
        //3 - Получение данных
        collection?.addSnapshotListener({ querySnapshot, error in
            
            if let error = error {
                completionRequest(.error(error))
                return
            }
            
            guard let document = querySnapshot else {
                completionRequest(.error(RequestFirebaseError.invalidGetCollection))
                return }
            
            do {
                let addresses = try document.documents.map{ try $0.data(as: DECAddress.self) }
                completionRequest(.object(addresses))
            } catch let error {
                completionRequest(.error(error))
            }
        })
    }
}
