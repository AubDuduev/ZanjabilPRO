//
//  DECYandexGeocoderMetaData.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexGeocoderMetaData {
	
	let fullAddress            : String?
	var yandexAddressSuggestion: DECYandexAddressSuggestion?
	
	enum CodingKeys: String, CodingKey {
		case fullAddress             = "text"
		case yandexAddressSuggestion = "Address"
	}
}
extension DECYandexGeocoderMetaData: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.fullAddress             = try? values.decode(String?.self, forKey: .fullAddress)
		self.yandexAddressSuggestion = try? values.decode(DECYandexAddressSuggestion?.self, forKey: .yandexAddressSuggestion)
	}
}
