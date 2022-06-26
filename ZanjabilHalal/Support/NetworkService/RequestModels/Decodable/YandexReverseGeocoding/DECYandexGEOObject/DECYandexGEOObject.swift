//
//  DECYandexGEOObject.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexGEOObject {
	
	var metaDataProperty: DECYandexMetaDataProperty?
	let coordinate      : DECYandexCoordinate?
	
	enum CodingKeys: String, CodingKey {
		case metaDataProperty = "metaDataProperty"
		case coordinate       = "Point"
	}
}
extension DECYandexGEOObject: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.metaDataProperty = try? values.decode(DECYandexMetaDataProperty?.self, forKey: .metaDataProperty)
		self.coordinate       = try? values.decode(DECYandexCoordinate?.self, forKey: .coordinate)
		self.metaDataProperty?.geocoderMetaData?.yandexAddressSuggestion?.coordinate = self.coordinate
	}
}
