//
//  DECDeliveryCheckPrice.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct DECDeliveryCheckPrice {
	
	let price         : String?
	let currencyRules : CODCurrencyRules?
	let distanceMeters: Double?
	let zoneID        : String?
	let eta           : Double?
	
	enum CodingKeys: String, CodingKey {
		case currencyRules  = "currencyRules"
		case distanceMeters = "distance_meters"
		case zoneID         = "zone_id"
		case price
		case eta
	}
}
extension DECDeliveryCheckPrice: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.price          = try? values.decode(String?.self,          forKey: .price         )
		self.currencyRules  = try? values.decode(CODCurrencyRules?.self,forKey: .currencyRules )
		self.distanceMeters = try? values.decode(Double?.self,          forKey: .distanceMeters)
		self.zoneID         = try? values.decode(String?.self,          forKey: .zoneID        )
		self.eta            = try? values.decode(Double?.self,          forKey: .eta           )
	}
}
