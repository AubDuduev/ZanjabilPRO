//
//  CODCurrencyRules.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODCurrencyRules {
	
	let code    : String?
	let text    : String?
	let template: String?
	let sign    : String?
	
	enum CodingKeys: String, CodingKey {
		case code
		case text
		case template
		case sign
	}
}
extension CODCurrencyRules: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.code     = try? values.decode(String?.self, forKey: .code)
		self.text     = try? values.decode(String?.self, forKey: .text)
		self.template = try? values.decode(String?.self, forKey: .template)
		self.sign     = try? values.decode(String?.self, forKey: .sign)
	}
}
extension CODCurrencyRules: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(code    , forKey: .code)
		try container.encode(text    , forKey: .text)
		try container.encode(template, forKey: .template)
		try container.encode(sign    , forKey: .sign)
	}
}
