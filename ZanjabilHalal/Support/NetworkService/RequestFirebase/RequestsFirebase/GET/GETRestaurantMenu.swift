//
//  GETRestaurantMenu.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Combine
import Foundation

public final class GETRestaurantMenu {
    
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
        let collection = self.abstractFactory.create(with: URLFirebaseRestaurantMenu())?.url
        //3 - Получение данных
        collection?.getDocuments(completion: { querySnapshot, error in
           
            if let error = error {
                completionRequest(.error(error))
                return
            }
            
            guard let document = querySnapshot else {
                completionRequest(.error(RequestFirebaseError.invalidGetCollection))
                return }
            
            do {
                let menuList = try document.documents.map{ try $0.data(as: DECMenu.self) }
                completionRequest(.object(menuList))
            } catch let error {
                completionRequest(.error(error))
            }
        })
    }
}
