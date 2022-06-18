//
//  DECYandexReverseGeocoding.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexReverseGeocoding {
   
   
   enum CodingKeys: String, CodingKey {
      
   }
}
extension DECYandexReverseGeocoding: Decodable {
   
   init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      self. = try? values.decode(.self, forKey: .offers)
   }
}
