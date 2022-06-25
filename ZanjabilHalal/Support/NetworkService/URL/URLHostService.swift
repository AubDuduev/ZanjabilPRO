//
//  URLHostService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

final class URLHostService {
	
	enum Host: String {
		
		case non
		case daDataSuggestion = "suggestions.dadata.ru"
		case yandexGeocoding  = "geocode-maps.yandex.ru"
	}
	enum Types {
		case Static(Host)
		case String(String?)
		case non
	}
	public func create(_ type: URLHostService.Types) -> String {
		switch type {
			case .Static(let host):
				return host.rawValue
			case .String(let stringHost):
				return stringHost ?? ""
			case .non:
				return ""
		}
	}
}

