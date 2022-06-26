//
//  DECYandexCoordinate.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 26.06.2022.
//
import Foundation

struct DECYandexCoordinate {
	
	let latitude : Double
	let longitude: Double
	
	enum CodingKeys: String, CodingKey {
		case coordinate = "pos"
	}
}
extension DECYandexCoordinate: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		let coordinate = ((try? values.decode(String?.self, forKey: .coordinate))) ?? ""
		self.latitude  = String(coordinate.split(separator: " ")[0]).toDouble() ?? 0
		self.longitude = String(coordinate.split(separator: " ")[1]).toDouble() ?? 0
	}
}
