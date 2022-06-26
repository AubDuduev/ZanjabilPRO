//
//  CODRoutePoint.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODRoutePoint {
	
	let coordinates      : [Double]?
	var deliveryAddress  : CODDeliveryAddress? = nil
	var deliveryContact  : CODDeliveryContact? = nil
	var externalOrderCost: String?             = nil
	var externalOrderID  : String?             = nil
	var pickupCode       : String?             = nil
	var pointID          : Int?                = nil
	var skipConfirmation : Bool?               = nil
	var routePointType   : RoutePointType?     = nil
	var visitOrder       : Int?                = nil
	
	enum CodingKeys: String, CodingKey {
		
		case externalOrderID   = "external_order_id"//Номер заказа из системы клиента. Передается для точки с типом destination
		case pickupCode        = "pickup_code"
		case pointID           = "point_id"
		case skipConfirmation  = "skip_confirmation"
		case routePointType    = "type"
		case visitOrder        = "visit_order"
		case externalOrderCost = "external_order_cost"
		case deliveryAddress   = "address"
		case deliveryContact   = "contact"
		case coordinates       = "coordinates"
	}
}
extension CODRoutePoint: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.coordinates         = try? values.decode([Double]?.self,           forKey: .coordinates )
		self.externalOrderID     = try? values.decode(String?.self,             forKey: .externalOrderID )
		self.pickupCode          = try? values.decode(String?.self,             forKey: .pickupCode      )
		self.externalOrderCost   = try? values.decode(String?.self,             forKey: .pickupCode      )
		self.pointID             = try? values.decode(Int?.self,                forKey: .pointID         )
		self.skipConfirmation    = try? values.decode(Bool?.self,               forKey: .skipConfirmation)
		self.visitOrder          = try? values.decode(Int?.self,                forKey: .visitOrder      )
		self.deliveryAddress     = try? values.decode(CODDeliveryAddress?.self, forKey: .deliveryAddress )
		self.deliveryContact     = try? values.decode(CODDeliveryContact?.self, forKey: .deliveryContact )
		let routePointTypeString = (try? values.decode(String?.self,            forKey: .routePointType) ) ?? ""
		self.routePointType      = RoutePointType(rawValue: routePointTypeString)
	}
}
extension CODRoutePoint: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(externalOrderID,  forKey: .externalOrderID  )
		try container.encode(pickupCode,       forKey: .pickupCode       )
		try container.encode(pointID,          forKey: .pointID          )
		try container.encode(skipConfirmation, forKey: .skipConfirmation )
		try container.encode(routePointType,   forKey: .routePointType   )
		try container.encode(visitOrder,       forKey: .visitOrder       )
		try container.encode(externalOrderCost,forKey: .externalOrderCost)
		try container.encode(deliveryAddress  ,forKey: .deliveryAddress  )
		try container.encode(deliveryContact  ,forKey: .deliveryContact  )
		try container.encode(coordinates      ,forKey: .coordinates  )
	}
}

enum RoutePointType: String, Codable {
	
	case source      //- точка отправления, где курьер забирает товар
	case destination //– точки назначения, где курьер передает товар
	case `return`    //- точка возврата товара (добавляется автоматически и по умолчанию совпадает с точкой отправления, но также можно определить другую точку)
}
