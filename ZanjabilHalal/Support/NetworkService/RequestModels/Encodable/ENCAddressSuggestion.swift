//
//  ENCAddressSuggestion.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 28.05.2022.
//
import Foundation

struct ENCAddressSuggestion {
	
	let query: String
	
	enum CodingKeys: String, CodingKey {
		
		case address = "query"
		
	}
}

extension ENCAddressSuggestion: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(query, forKey: .address)
	}
}
