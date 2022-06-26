//
//  ENCRequirements.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct ENCRequirements {
	
	let taxiClass: String?
  
   enum CodingKeys: String, CodingKey {
      
      case taxiClass = "taxi_class"
   }
}

extension ENCRequirements: Encodable {
   
   func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(taxiClass, forKey: .taxiClass)
   }
}
