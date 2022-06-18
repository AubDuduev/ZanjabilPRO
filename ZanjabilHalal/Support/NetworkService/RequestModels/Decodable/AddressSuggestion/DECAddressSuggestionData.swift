//
//  DECAddressSuggestionData.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 28.05.2022.
//
import Foundation

struct DECAddressSuggestionData {
	
	let country   : String?
	let region    : String?
	let city      : String?
	let area      : String?
	let postalCode: String?
	let street    : String?
	let latitude  : Double
	let longitude : Double
	
	enum CodingKeys: String, CodingKey {
		
		case country
		case region
		case city
		case area
		case postalCode = "postal_code"
		case street
		case latitude   = "geo_lat"
		case longitude  = "geo_lon"
	}
}
extension DECAddressSuggestionData: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.country    = try? values.decode(String?.self, forKey: .country    )
		self.region     = try? values.decode(String?.self, forKey: .region     )
		self.city       = try? values.decode(String?.self, forKey: .city       )
		self.area       = try? values.decode(String?.self, forKey: .area       )
		self.postalCode = try? values.decode(String?.self, forKey: .postalCode )
		self.street     = try? values.decode(String?.self, forKey: .street     )
		self.latitude   = (try? values.decode(String?.self, forKey: .latitude  ))?.toDouble() ?? 0.0
		self.longitude  = (try? values.decode(String?.self, forKey: .longitude ))?.toDouble() ?? 0.0
	}
}
