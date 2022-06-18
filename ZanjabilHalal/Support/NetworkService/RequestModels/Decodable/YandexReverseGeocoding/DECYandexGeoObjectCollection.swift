//
//  DECYandexGeoObjectCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

struct DECYandexGeoObjectCollection {
	
	let collection: [DECYandexGeoObjects]?
	
	enum CodingKeys: String, CodingKey {
		
		case collection  = "featureMember"
	}
}
extension DECYandexGeoObjectCollection: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.collection = try? values.decode([DECYandexGeoObjects]?.self, forKey: .collection)
	}
}
