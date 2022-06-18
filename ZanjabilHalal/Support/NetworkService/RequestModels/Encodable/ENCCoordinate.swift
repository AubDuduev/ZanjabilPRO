//
//  ENCCoordinate.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 11.06.2022.
//
import Foundation

struct ENCCoordinate: Encodable {
	
	let lat          : Double
	let lon          : Double
	let radius_meters: Int    = 5
	let language     : String = "ru"
	let count        : Int?
}
