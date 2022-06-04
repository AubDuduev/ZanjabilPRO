//
//  DECAddress.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import Foundation

struct DECAddress {
    
    let ID       : String
    let build    : String
    let city     : String
    let apartment: String
    let floor    : String
    let intercom : String
    let street   : String
    var isDefault: Bool
    
    enum CodingKeys: String, CodingKey {
        case ID
        case build
        case city
        case apartment
        case floor
        case intercom
        case street
        case isDefault
    }
}
extension DECAddress: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.ID        = (try? values.decode(String.self, forKey: .ID       )) ?? ""
        self.build     = (try? values.decode(String.self, forKey: .build    )) ?? ""
        self.city      = (try? values.decode(String.self, forKey: .city     )) ?? ""
        self.apartment = (try? values.decode(String.self, forKey: .apartment)) ?? ""
        self.floor     = (try? values.decode(String.self, forKey: .floor    )) ?? ""
        self.intercom  = (try? values.decode(String.self, forKey: .intercom )) ?? ""
        self.street    = (try? values.decode(String.self, forKey: .street   )) ?? ""
        self.isDefault = (try? values.decode(Bool.self  , forKey: .isDefault)) ?? false
    }
}
