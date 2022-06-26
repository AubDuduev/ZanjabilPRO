//
//  CODEmergencyContact.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODEmergencyContact {
	
	let name : String?
	let phone: String?
	
	enum CodingKeys: String, CodingKey {
		case name  = "name"
		case phone = "phone"
	}
}
extension CODEmergencyContact: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.name  = try? values.decode(String?.self, forKey: .name)
		self.phone = try? values.decode(String?.self, forKey: .phone)
	}
}
extension CODEmergencyContact: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(name  , forKey: .name)
		try container.encode(phone, forKey: .phone)
	}
}
