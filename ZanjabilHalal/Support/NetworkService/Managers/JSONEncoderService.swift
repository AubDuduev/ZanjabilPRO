//
//  JSONEncoderService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 12.03.2022.
//
import Foundation

final class JSONEncoderService {
    
    func encode<T: Encodable>(with encodeObject: T) -> Data? {
        do {
            let data = try JSONEncoder().encode(encodeObject)
            return data
        } catch let error {
            print(error.localizedDescription, "Ошибка декодинга")
            return nil
        }
    }
}
