//
//  ENCDeliveryCheckPrice.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation
struct ENCDeliveryCheckPrice{
  
   enum CodingKeys: String, CodingKey {
      
      case amount    = "amount"
     
   }
}

extension ENCDeliveryCheckPrice: Encodable {
   
   func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      
      try container.encode(amount   , forKey: .amount)
   }
}
