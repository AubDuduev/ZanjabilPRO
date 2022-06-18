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
	}
	enum ChangePath {
		
		case non
		case suggestion(Path, Path, Path, Path, Path, Path)
		case reverseGeocoding(Path, Path, Path, Path, Path, Path)
		case yandexReverseGeocoding(Path)
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
		}
	}
}

