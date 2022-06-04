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
	}
	enum ChangePath {
		
		case non
		case suggestion(Path, Path, Path, Path, Path, Path)
	}
	
	public func create(change: ChangePath) -> String {
		//create Change Path for url
		switch change {
				//MARK: - Non
			case .non:
				return ""
			case .suggestion(let suggestions, let api, let foreOne, let rs, let suggest, let address):
				return ["", suggestions.rawValue, api.rawValue, foreOne.rawValue, rs.rawValue, suggest.rawValue, address.rawValue].joined(separator: "/")
		}
	}
}

