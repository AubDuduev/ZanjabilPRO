//
//  DECYandexAddressComponent.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexAddressComponent {
	
	let kind: AddressComponent
	var name: String?
	
	enum CodingKeys: String, CodingKey {
		case kind
		case name
	}
}
extension DECYandexAddressComponent: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		let kindRawValue = (try? values.decode(String?.self, forKey: .kind)) ?? ""
		self.kind = AddressComponent(rawValue: kindRawValue) ?? .none
		
		switch self.kind {
			case .street:
				self.name = try? values.decode(String?.self, forKey: .name)
				self.name = self.name?.replacingOccurrences(of: "улица", with: "")
			default:
				self.name = try? values.decode(String?.self, forKey: .name)
		}
	}
}

enum AddressComponent: String {
	
	case street
	case build = "house"
	case area
	case city  = "locality"
	case country
	case none
}
