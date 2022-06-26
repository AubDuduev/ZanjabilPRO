//
//  DECClientRequirements.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct DECClientRequirements {
	
	let assignRobot: Bool?
	let proCourier : Bool?
	let taxiClass  : YandexTaxiClass?
	
	enum CodingKeys: String, CodingKey {
		
		case assignRobot = "assign_robot"
		case proCourier  = "pro_courier"
		case taxiClass   = "taxi_class"
	}
}

extension DECClientRequirements: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.assignRobot = try? values.decode(Bool?.self,            forKey: .assignRobot)
		self.proCourier  = try? values.decode(Bool?.self,            forKey: .proCourier )
		self.taxiClass   = try? values.decode(YandexTaxiClass?.self, forKey: .taxiClass  )
	}
}

enum YandexTaxiClass: String, Decodable {
	case courier, express, cargo
}


