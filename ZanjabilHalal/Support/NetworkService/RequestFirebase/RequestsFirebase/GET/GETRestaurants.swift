//
//  GETRestaurants.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Combine
import Foundation

public final class GETRestaurants {
    
    private var abstractFactory  = URLAbstractFactory()
    private var urlBody          = URLBody()
    private let internetСheck    = InternetСheckService()
    private var cancelable       : Set<AnyCancellable> = []
    
    public func request(data: Any? = nil, completionRequest: @escaping Closure<RequestResult>) {
        //1 - проверка наличия интернета
        guard self.internetСheck.check() else { return }
        //2 - Создание URL
        let collection = self.abstractFactory.create(with: URLFirebaseRestaurants())?.url
        //3 - Получение данных
        collection?.getDocuments(completion: { snapShot, error in
            print(snapShot)
        })
    }
}
