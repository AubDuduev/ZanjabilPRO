//
//  SendPackage.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODSendPackage {
  
	"cost_currency": "RUB",
	"cost_value": "2.00",
	"droppof_point": 2,
	"extra_id": "БП-208",
	"pickup_point": 1,
	"quantity": 1,
  
  enum CodingKeys: String, CodingKey {
    
  }
}
extension CODSendPackage: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self. = try? values.decode(.self, forKey: .)
  }
}
extension CODSendPackage: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(amount   , forKey: .amount)
	}
}
