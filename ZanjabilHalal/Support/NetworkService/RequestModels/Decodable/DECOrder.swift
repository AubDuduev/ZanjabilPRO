//
//  DECOrders.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 30.04.2022.
//
import Foundation

struct DECOrder {
    
    let createDate: Date?
    let dishes    : [DECOrderDish]?
    
    enum CodingKeys: String, CodingKey {
        case createDate
        case dishes
    }
}
extension DECOrder: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.dishes     = try? values.decode([DECOrderDish]?.self, forKey: .dishes)
        self.createDate = try? values.decode(Date?.self, forKey: .createDate)
    }
}
