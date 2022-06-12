//
//  ENCCoordinate.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 11.06.2022.
//
import Foundation
struct ENCCoordinate{
  
   enum CodingKeys: String, CodingKey {
      
      case amount    = "amount"
     
   }
}

extension ENCCoordinate: Encodable {
   
   func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      
      try container.encode(amount   , forKey: .amount)
   }
}
