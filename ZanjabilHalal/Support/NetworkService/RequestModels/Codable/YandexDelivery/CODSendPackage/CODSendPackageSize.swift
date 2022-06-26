//
//  CODSendPackageSize.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODSendPackageSize {
	
	let height: Double?
	let length: Double?
	let width : Double?
	
	enum CodingKeys: String, CodingKey {
		
		case height
		case length
		case width
	}
}
extension CODSendPackageSize: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.height = try? values.decode(Double?.self, forKey: .height)
		self.length = try? values.decode(Double?.self, forKey: .length)
		self.width  = try? values.decode(Double?.self, forKey: .width)
	}
}
extension CODSendPackageSize: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(height, forKey: .height)
		try container.encode(length, forKey: .length)
		try container.encode(width , forKey: .width )
	}
}
