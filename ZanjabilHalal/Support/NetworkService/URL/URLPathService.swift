//
//  URLPath.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

final class URLPath {
	
	enum Path: String {
		
		case non = ""
		case suggestions
		case api
		case foreOne = "4_1"
		case suggest
		case address
		case rs
		case geolocate
		case oneX = "1.x"
		case b2b
		case cargo
		case integration
		case v1
		case checkPrice = "check-price"
	}
	enum ChangePath {
		
		case non
		case suggestion(Path, Path, Path, Path, Path, Path)
		case reverseGeocoding(Path, Path, Path, Path, Path, Path)
		case yandexReverseGeocoding(Path)
		case deliveryCheckPrice(Path, Path, Path, Path, Path)
	}
	
	public func create(change: ChangePath) -> String {
		//create Change Path for url
		switch change {
				//MARK: - Non
			case .non:
				return ""
			case .suggestion(let suggestions, let api, let foreOne, let rs, let suggest, let address):
				return ["", suggestions.rawValue, api.rawValue, foreOne.rawValue, rs.rawValue, suggest.rawValue, address.rawValue].joined(separator: "/")
			case .reverseGeocoding(let suggestions, let api, let foreOne, let rs, let geolocate, let address):
				return ["", suggestions.rawValue, api.rawValue, foreOne.rawValue, rs.rawValue, geolocate.rawValue, address.rawValue].joined(separator: "/")
			case .yandexReverseGeocoding(let oneX):
				return ["", oneX.rawValue].joined(separator: "/")
			//https://b2b.taxi.yandex.net/b2b/cargo/integration/v1/check-price
			case .deliveryCheckPrice(let b2b, let cargo, let integration, let v1, let checkPrice):
				return ["", b2b.rawValue, cargo.rawValue, integration.rawValue, v1.rawValue, checkPrice.rawValue].joined(separator: "/")
		}
	}
}

