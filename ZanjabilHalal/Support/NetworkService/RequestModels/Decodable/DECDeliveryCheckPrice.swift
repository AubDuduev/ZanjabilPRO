//
//  DECDeliveryCheckPrice.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct DECDeliveryCheckPrice {
	
	
	enum CodingKeys: String, CodingKey {
		
	}
}
extension DECDeliveryCheckPrice: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self. = try? values.decode(.self, forKey: .offers)
	}
}
