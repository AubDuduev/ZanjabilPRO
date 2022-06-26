//
//  SendPackage.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODSendPackage {
	
	var costCurrency: String? = nil//RUB
	var costValue   : String? = nil
	var droppOfPoint: Int?    = nil
	var extraID     : String? = nil//"БП-208"
	var pickupPoint : Int?    = nil
	let quantity    : Int?
	var title       : String? = nil
	let weight      : Int?
	let size        : CODSendPackageSize?
	
	enum CodingKeys: String, CodingKey {
		
		case costCurrency = "cost_currenc"
		case costValue    = "cost_value"
		case droppOfPoint = "droppof_point"
		case extraID      = "extra_id"
		case pickupPoint  = "pickup_point"
		case quantity
		case size
		case weight
		case title
	}
}
extension CODSendPackage: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.costCurrency = try? values.decode(String?.self,             forKey: .costCurrency)
		self.title        = try? values.decode(String?.self,             forKey: .title       )
		self.weight       = try? values.decode(Int?.self,                forKey: .weight      )
		self.costValue    = try? values.decode(String?.self,             forKey: .costValue   )
		self.droppOfPoint = try? values.decode(Int?.self,                forKey: .droppOfPoint)
		self.extraID      = try? values.decode(String?.self,             forKey: .extraID     )
		self.pickupPoint  = try? values.decode(Int?.self,                forKey: .pickupPoint )
		self.quantity     = try? values.decode(Int?.self,                forKey: .quantity    )
		self.size         = try? values.decode(CODSendPackageSize?.self, forKey: .size        )
	}
}
extension CODSendPackage: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(costCurrency, forKey: .costCurrency)
		try container.encode(costValue   , forKey: .costValue   )
		try container.encode(droppOfPoint, forKey: .droppOfPoint)
		try container.encode(extraID     , forKey: .extraID     )
		try container.encode(pickupPoint , forKey: .pickupPoint )
		try container.encode(quantity    , forKey: .quantity    )
		try container.encode(size        , forKey: .size        )
	}
}
