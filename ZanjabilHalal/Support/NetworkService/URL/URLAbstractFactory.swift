//
//  URLAbstractFactory.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

final class URLAbstractFactory {
    
    //Создаем урл API для сетевых запросов
    public func create(_ urlCreatoble: URLCreateProtocol, dataForUrl: Any? = nil) -> ReturnURL? {
        return urlCreatoble.create(with: dataForUrl)
    }
    
    //Создаем урл Firebase для сетевых запросов
    public func create(with typeUrlFirebase: URLCreateFirebaseProtocol, dataForUrl: Any? = nil) -> ReturnFirebaseURL? {
        return typeUrlFirebase.create(with: dataForUrl)
    }
}
