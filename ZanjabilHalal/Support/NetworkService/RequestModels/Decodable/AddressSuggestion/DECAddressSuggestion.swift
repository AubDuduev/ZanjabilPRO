//
//  DECAddressSuggestion.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 28.05.2022.
//
import Foundation

struct DECAddressSuggestion {
	
	let fullAddress: String?
	let addressData: DECAddressSuggestionData?
	
	enum CodingKeys: String, CodingKey {
		
		case fullAddress = "value"
		case addressData = "data"
	}
}
extension DECAddressSuggestion: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.fullAddress = try? values.decode(String?.self, forKey: .fullAddress)
		self.addressData = try? values.decode(DECAddressSuggestionData?.self, forKey: .addressData)
	}
}
