//
//  URLParameterService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

final class URLParameters: NSObject {
    
    private var queryKeyQueryValue  : [QueryKey: QueryValue]!
    private var queryKeyStringValue : [QueryKey: String?]!
    private var stringKeyStringValue: [String: String]!
    
    enum QueryItemsType {
        case none
    }
    enum QueryKey: String {
        case none
    }
    enum QueryValue: String {
        case none
    }
    enum QueryValueString {
        case none
    }
    enum QueryKeyStringValueString {
        case none
    }
    enum DictionaryType {
        case QueryKeyQueryValue([QueryKey: QueryValue])
        case QueryKeyStringValue([QueryKey: String?])
        case StringKeyStringValue([String: String])
    }
    //MARK: - Функция для создании параметров для URL
    public func create(queryItems: QueryItemsType, _ valueString: QueryValueString = .none, _ queryKeyStringValueString: QueryKeyStringValueString = .none) -> [URLQueryItem]? {
        switch queryItems {
            case .none:
                return nil
        }
    }
    //MARK: - Функция для генерации параметров для URL
    //пробегается с помощью MAP по словарю и выдает тип [URLQueryItem]
    private func createQueryItems(with dictionaryType: DictionaryType) -> [URLQueryItem] {
        switch dictionaryType {
                //Создаем параметр из статических Key/Value
            case .QueryKeyQueryValue(let dictionary):
                return dictionary.map{ URLQueryItem(name: $0.rawValue, value: $1.rawValue) }
                //Создаем параметр из статический Key и динамического Value
            case .QueryKeyStringValue(let dictionary):
                let result = dictionary.compactMap { i -> URLQueryItem? in
                    if i.value != nil {
                        return URLQueryItem(name: i.key.rawValue, value: i.value)
                    } else {
                        return nil
                    }
                }
                return result
                //Создаем параметр из динамического Key и динамического Value
            case .StringKeyStringValue(let dictionary):
                return dictionary.compactMap { URLQueryItem(name: $0, value: $1) }
        }
    }
}
