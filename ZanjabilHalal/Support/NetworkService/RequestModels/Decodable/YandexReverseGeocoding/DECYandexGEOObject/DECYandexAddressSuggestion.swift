//
//  DECYandexAddressSuggestion.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexAddressSuggestion {
	
	let postalCode       : String?
	let country          : String?
	let build            : String?
	let street           : String?
	let area             : String?
	let city             : String?
	let addressComponents: [DECYandexAddressComponent]
	
	enum CodingKeys: String, CodingKey {
		
		case postalCode = "postal_code"
		case components = "Components"
	}
}
extension DECYandexAddressSuggestion: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.postalCode        = try? values.decode(String?.self, forKey: .postalCode)
		self.addressComponents = (try? values.decode([DECYandexAddressComponent]?.self, forKey: .components)) ?? []
		self.country           = self.addressComponents.first(where: { $0.kind == .country })?.name
		self.build             = self.addressComponents.first(where: { $0.kind == .build   })?.name
		self.street            = self.addressComponents.first(where: { $0.kind == .street  })?.name
		self.area              = self.addressComponents.first(where: { $0.kind == .area    })?.name
		self.city              = self.addressComponents.first(where: { $0.kind == .city    })?.name
	}
}
