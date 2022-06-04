//
//  DECMenu.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Foundation
import SwiftUI

struct DECMenu {
    
    let name    : String?
    let dishes  : [DECDish]?
    let category: DECCategory?
    
    enum CodingKeys: String, CodingKey {
        case dishes
        case name
        case category = "data"
    }
}
extension DECMenu: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.dishes   = try? values.decode([DECDish]?.self  , forKey: .dishes)
        self.name     = try? values.decode(String?.self     , forKey: .name)
        self.category = try? values.decode(DECCategory?.self, forKey: .category)
    }
}

extension DECMenu: Equatable {
    
    static func == (lhs: DECMenu, rhs: DECMenu) -> Bool {
       return lhs.name == rhs.name
    }
}
