//
//  ENCProduct.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 12.03.2022.
//
import Foundation
struct ENCProduct {
    
    let amount: String
  
   enum CodingKeys: String, CodingKey {
      
      case amount = "amount"
     
   }
}

extension ENCProduct: Encodable {
   
   func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      
      try container.encode(amount   , forKey: .amount)
   }
}
