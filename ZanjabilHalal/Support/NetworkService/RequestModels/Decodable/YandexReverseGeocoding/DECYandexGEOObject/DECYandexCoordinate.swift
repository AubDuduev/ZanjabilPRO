//
//  DECYandexCoordinate.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 26.06.2022.
//
import Foundation

struct DECYandexCoordinate {
	
	
	enum CodingKeys: String, CodingKey {
		
	}
}
extension DECYandexCoordinate: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self. = try? values.decode(.self, forKey: .offers)
	}
}
