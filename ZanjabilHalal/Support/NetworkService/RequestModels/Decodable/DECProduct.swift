//
//  DECProduct.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

struct DECProduct {
   
    let name: String?
   
   enum CodingKeys: String, CodingKey {
      case name
   }
}
extension DECProduct: Decodable {
   
   init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      self.name = try? values.decode(String.self, forKey: .name)
   }
}
