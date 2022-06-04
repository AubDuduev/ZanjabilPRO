//
//  DECOrderDish.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import Foundation

struct DECOrderDish {
    
    let ID    : String?
    let name  : String?
    let price : Decimal?
    let count : Int?
    
    enum CodingKeys: String, CodingKey {
        case ID
        case name
        case price
        case count
    }
}
extension DECOrderDish: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.ID    = try? values.decode(String?.self , forKey: .ID)
        self.name  = try? values.decode(String?.self , forKey: .name)
        self.price = try? values.decode(Decimal?.self, forKey: .price)
        self.count = try? values.decode(Int?.self    , forKey: .count)
    }
}
