//
//  DECYandexGeoObjects.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexGeoObjects {
	
	let geoObjects: DECYandexGEOObject?
	
	enum CodingKeys: String, CodingKey {
		
		case geoObjects = "GeoObject"
	}
}
extension DECYandexGeoObjects: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.geoObjects = try? values.decode(DECYandexGEOObject?.self, forKey: .geoObjects)
	}
}
