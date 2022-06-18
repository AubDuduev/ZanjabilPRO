//
//  DECYandexGEOObject.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexGEOObject {
	
	let fullStreet : String?
	let fullAddress: String?
	
	enum CodingKeys: String, CodingKey {
		
		case fullStreet  = "name"
		case fullAddress = "description"
	}
}
extension DECYandexGEOObject: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.fullStreet  = try? values.decode(String?.self, forKey: .fullStreet)
		self.fullAddress = try? values.decode(String?.self, forKey: .fullAddress)
	}
}
