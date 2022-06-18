//
//  DECYandexGEOObject.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexGEOObject {
	
	let metaDataProperty: DECYandexMetaDataProperty?
	
	enum CodingKeys: String, CodingKey {
		
		case metaDataProperty = "metaDataProperty"
	}
}
extension DECYandexGEOObject: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.metaDataProperty = try? values.decode(DECYandexMetaDataProperty?.self, forKey: .metaDataProperty)
	}
}
