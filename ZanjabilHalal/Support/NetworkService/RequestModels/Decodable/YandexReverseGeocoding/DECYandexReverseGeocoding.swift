//
//  DECYandexReverseGeocoding.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexReverseGeocoding {
	
	let response: DECYandexReverseGeocodingResponse?
	
	enum CodingKeys: String, CodingKey {
		
		case response = "response"
	}
}
extension DECYandexReverseGeocoding: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.response = try? values.decode(DECYandexReverseGeocodingResponse?.self, forKey: .response)
	}
}
