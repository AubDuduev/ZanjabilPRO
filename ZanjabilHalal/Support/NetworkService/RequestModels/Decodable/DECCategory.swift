//
//  DECCategory.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 19.03.2022.
//
import Foundation

struct DECCategory {
    
    let name : String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case image
    }
}

extension DECCategory: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
		self.name  = (try? values.decode(String?.self, forKey: .name)) ?? ""
        self.image = try? values.decode(String?.self, forKey: .image)
    }
}
