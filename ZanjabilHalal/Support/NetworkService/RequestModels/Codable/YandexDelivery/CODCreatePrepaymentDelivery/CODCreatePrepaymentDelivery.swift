//
//  CODCreatePrepaymentDelivery.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODCreatePrepaymentDelivery {
   
	let clientRequirements: CODClientRequirements
   
}
extension CODCreatePrepaymentDelivery: Decodable {
   
   init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      self. = try? values.decode(.self, forKey: .offers)
   }
}
