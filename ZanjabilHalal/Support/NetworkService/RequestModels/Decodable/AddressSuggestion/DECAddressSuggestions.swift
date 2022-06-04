//
//  DECAddressSuggestions.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 28.05.2022.
//
import Foundation

struct DECAddressSuggestions {
	
	let addresses: [DECAddressSuggestion]
	
	enum CodingKeys: String, CodingKey {
		case addresses = "suggestions"
	}
}
extension DECAddressSuggestions: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.addresses = (try? values.decode([DECAddressSuggestion].self, forKey: .addresses)) ?? []
	}
}
