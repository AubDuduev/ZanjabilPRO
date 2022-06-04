//
//  JSONDecoderService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

final class JSONDecoderService {
   
   private let decoder = JSONDecoder()
   
   public func decode<T: Decodable>(jsonType: T.Type, data: Data?, completion: @escaping ClosureDecode){
      guard let data = data else { return }
      do{
         let json = try self.decoder.decode(T.self, from: data)
         completion(.json(json))
         //return error
      } catch let error {
         let jsonString = String(data: data, encoding: .utf8) ?? " Error JsonString"
         print(error.localizedDescription, "Error parse JSONDecode \(jsonString) string convert")
         completion(.error(error))
      }
   }
}
