//
//  CODDeliveryContact.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODDeliveryContact {
	
	let email: String?
	let name : String?
	let phone: String?
	
	enum CodingKeys: String, CodingKey {
		case email
		case name
		case phone
	}
}
extension CODDeliveryContact: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.email = try? values.decode(String?.self, forKey: .name)
		self.phone = try? values.decode(String?.self, forKey: .email)
		self.name  = try? values.decode(String?.self, forKey: .phone)
	}
}
extension CODDeliveryContact: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(email, forKey: .name)
		try container.encode(phone, forKey: .email)
		try container.encode(name,  forKey: .phone)
	}
}
