//
//  CODSendPackageSize.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODCODSendPackageSize {
  
  
  enum CodingKeys: String, CodingKey {
    
  }
}
extension CODCODSendPackageSize: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self. = try? values.decode(.self, forKey: .)
  }
}
extension CODCODSendPackageSize: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(amount   , forKey: .amount)
	}
}
