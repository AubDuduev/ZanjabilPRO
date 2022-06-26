//
//  ENCDeliveryCheckPrice.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct ENCDeliveryCheckPrice {
	
	let sendPackages      : [CODSendPackage]?
	let clientRequirements: CODClientRequirements?
	let routePoints       : [CODRoutePoint]?
	let skipDoorToDoor    : Bool?
	
	enum CodingKeys: String, CodingKey {
		
		case sendPackages       = "items"
		case clientRequirements = "client_requirements"
		case routePoints        = "route_points"
		case skipDoorToDoor     = "skip_door_to_door"
	}
}

extension ENCDeliveryCheckPrice: Encodable {
	
	func encode(to encoder: Encoder) throws {
		
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(sendPackages,       forKey: .sendPackages)
		try container.encode(clientRequirements, forKey: .clientRequirements)
		try container.encode(routePoints,        forKey: .routePoints)
		try container.encode(skipDoorToDoor,     forKey: .skipDoorToDoor)
	}
}
