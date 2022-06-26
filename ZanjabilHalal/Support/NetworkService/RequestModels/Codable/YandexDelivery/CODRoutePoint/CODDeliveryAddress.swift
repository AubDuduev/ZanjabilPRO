//
//  CODDeliveryAddress.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODDeliveryAddress {
	
	let coordinates  : [Double]?
	let building     : String?
	let buildingName : String?
	let city         : String?
	let comment      : String?
	let country      : String?
	let description  : String?
	let doorCode     : String?
    let doorCodeExtra: String?
	let doorbellName : String?
    let fullName     : String?
	let porch        : String?
	let sflat        : String?
	let sfloor       : String?
	
	enum CodingKeys: String, CodingKey {
		case coordinates     = "coordinates"
		case building        = "building"
		case buildingName    = "building_name"
		case city            = "city"
		case comment         = "comment"
		case country         = "country"
		case description     = "description"
		case doorCode        = "door_code"
		case doorCodeExtra   = "door_code_extra"
		case doorbellName    = "doorbell_name"
		case fullName        = "fullname"
		case porch           = "porch"
		case sflat           = "sflat"
		case sfloor          = "sfloor"
	}
}
extension CODDeliveryAddress: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.coordinates   = try? values.decode([Double]?.self, forKey: .coordinates   )
		self.building      = try? values.decode(String?.self,   forKey: .building      )
		self.buildingName  = try? values.decode(String?.self,   forKey: .buildingName  )
		self.city          = try? values.decode(String?.self,   forKey: .city          )
		self.comment       = try? values.decode(String?.self,   forKey: .comment       )
		self.country       = try? values.decode(String?.self,   forKey: .country       )
		self.description   = try? values.decode(String?.self,   forKey: .description   )
		self.doorCode      = try? values.decode(String?.self,   forKey: .doorCode      )
		self.doorCodeExtra = try? values.decode(String?.self,   forKey: .doorCodeExtra )
		self.doorbellName  = try? values.decode(String?.self,   forKey: .doorbellName  )
		self.fullName      = try? values.decode(String?.self,   forKey: .fullName      )
		self.porch         = try? values.decode(String?.self,   forKey: .porch         )
		self.sflat         = try? values.decode(String?.self,   forKey: .sflat         )
		self.sfloor        = try? values.decode(String?.self,   forKey: .sfloor        )
	}
}
extension CODDeliveryAddress: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(coordinates  , forKey: .coordinates  )
		try container.encode(building     , forKey: .building     )
		try container.encode(buildingName , forKey: .buildingName )
		try container.encode(city         , forKey: .city         )
		try container.encode(comment      , forKey: .comment      )
		try container.encode(country      , forKey: .country      )
		try container.encode(description  , forKey: .description  )
		try container.encode(doorCode     , forKey: .doorCode     )
		try container.encode(doorCodeExtra, forKey: .doorCodeExtra)
		try container.encode(doorbellName , forKey: .doorbellName )
		try container.encode(fullName     , forKey: .fullName     )
		try container.encode(porch        , forKey: .porch        )
		try container.encode(sflat        , forKey: .sflat        )
		try container.encode(sfloor       , forKey: .sfloor       )
	}
}
