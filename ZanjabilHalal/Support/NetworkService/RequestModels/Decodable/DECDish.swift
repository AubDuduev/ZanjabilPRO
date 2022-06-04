//
//  DECMenuDish.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Foundation

struct DECDish {
    
    let ID         : String?
    let name       : String?
    let price      : Decimal?
    let preview    : String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        
        case ID
        case name
        case price
        case preview
        case description
    }
}
extension DECDish: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.ID          = try? values.decode(String?.self , forKey: .ID)
        self.name        = try? values.decode(String?.self , forKey: .name)
        self.price       = try? values.decode(Decimal?.self, forKey: .price)
        self.preview     = try? values.decode(String?.self , forKey: .preview)
        self.description = try? values.decode(String?.self , forKey: .description)
    }
}
