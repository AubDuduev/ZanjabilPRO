//
//  DECAddress.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import CoreLocation
import Foundation

struct DECAddress {
    
    let ID        : String
    let build     : String
    let city      : String
    let apartment : String
    let floor     : String
    let intercom  : String
    let street    : String
	let latitude  : String
	let longitude : String
    var isDefault : Bool
    
    enum CodingKeys: String, CodingKey {
        case ID
        case build
        case city
        case apartment
        case floor
        case intercom
        case street
		case latitude
		case longitude
        case isDefault
		case coordinate
    }
}
extension DECAddress: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.ID         = (try? values.decode(String.self, forKey: .ID        )) ?? ""
        self.build      = (try? values.decode(String.self, forKey: .build     )) ?? ""
        self.city       = (try? values.decode(String.self, forKey: .city      )) ?? ""
        self.apartment  = (try? values.decode(String.self, forKey: .apartment )) ?? ""
        self.floor      = (try? values.decode(String.self, forKey: .floor     )) ?? ""
        self.latitude   = (try? values.decode(String.self, forKey: .latitude  )) ?? ""
		self.longitude  = (try? values.decode(String.self, forKey: .longitude )) ?? ""
		self.intercom   = (try? values.decode(String.self, forKey: .intercom  )) ?? ""
        self.street     = (try? values.decode(String.self, forKey: .street    )) ?? ""
        self.isDefault  = (try? values.decode(Bool.self,   forKey: .isDefault )) ?? false
    }
}
extension DECAddress: Equatable {
	static func == (lhs: DECAddress, rhs: DECAddress) -> Bool {
		let isEquatable = (lhs.ID        == rhs.ID        &&
						   lhs.build     == rhs.build     &&
						   lhs.city      == rhs.city      &&
						   lhs.apartment == rhs.apartment &&
						   lhs.floor     == rhs.floor     &&
						   lhs.intercom  == rhs.intercom  &&
						   lhs.street    == rhs.street    &&
						   lhs.latitude  == rhs.latitude  &&
						   lhs.longitude == rhs.longitude &&
						   lhs.isDefault == rhs.isDefault)
		return isEquatable
	}
}
