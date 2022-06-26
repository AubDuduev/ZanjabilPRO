//
//  CODClientRequirements.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODClientRequirements {
	
	let assignRobot : Bool?
	let cargoLoaders: Int?
	let cargoOptions: [String]?
	let cargoType   : String?
	let proCourier  : Bool?
	let taxiClass   : String?
	
	enum CodingKeys: String, CodingKey {
		
		case assignRobot  = "assign_robot"
		case proCourier   = "pro_courier"
		case taxiClass    = "taxi_class"
		case cargoType    = "cargo_type"
		case cargoLoaders = "cargo_loaders"
		case cargoOptions = "cargo_options"
	}
}
extension CODClientRequirements: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.assignRobot  = try? values.decode(Bool?.self,     forKey: .assignRobot )
		self.cargoLoaders = try? values.decode(Int?.self,      forKey: .cargoLoaders)
		self.cargoOptions = try? values.decode([String]?.self, forKey: .taxiClass   )
		self.proCourier   = try? values.decode(Bool?.self,     forKey: .proCourier  )
		self.taxiClass    = try? values.decode(String?.self,   forKey: .taxiClass   )
		self.cargoType    = try? values.decode(String?.self,   forKey: .cargoType   )
	}
}
extension CODClientRequirements: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(assignRobot,  forKey: .assignRobot )
		try container.encode(proCourier,   forKey: .proCourier  )
		try container.encode(taxiClass,    forKey: .taxiClass   )
		try container.encode(cargoLoaders, forKey: .cargoLoaders)
		try container.encode(cargoOptions, forKey: .cargoOptions)
		try container.encode(cargoType,    forKey: .cargoType   )
	}
}

enum YandexTaxiClass: String, Codable {
	case courier, express, cargo
}
enum YandexCargoOptions: String, Codable {
	case thermoBag   = "thermobag"
	case autoCourier = "auto_courier"
	case cargo
	 /*
	 Список дополнительных опций тарифа.
	 Возможные отдельные опции:
	 auto_courier (курьер только на машине)
	 thermobag (курьер с термосумкой)
	 Пример списка опций: ["auto_courier"].
	 Точный список возможных значений для конкретной геоточки уточните с помощью метода получения тарифов v1/tariffs
	 */
}
enum YandexCargoType : String, Codable {
	case small  = "van"   //"Маленький кузов"
	case middle = "lcv_m" //Средний кузов
	case big    = "lcv_l" //Большой кузов
}

