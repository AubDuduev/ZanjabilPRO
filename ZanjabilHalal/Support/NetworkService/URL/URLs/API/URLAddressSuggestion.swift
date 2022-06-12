//
//  URLAddressSuggestion.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 28.05.2022.
//
import Foundation
//https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address

final class URLAddressSuggestion: URLCreateProtocol {
	
	private var urlPath    = URLPath()
	private var urls       = URLStaticString()
	private var host       = URLHostService()
	private var urlScheme  = URLSchemeService()
	private var custom     = URLCreateService()
	private var parameters = URLParameters()
	
	public func create(with data: Any? = nil) -> ReturnURL? {
		let path       = self.urlPath.create(change: .suggestion(.suggestions, .api, .foreOne, .rs, .suggest, .address))
		let host       = self.host.create(.Static(.daDataSuggestion))
		let customURL  = self.custom.create(type: .init(scheme: .https, host: host, path: path))
		let url        = URL(string: customURL.string ?? "")
		return (customURL.string, url)
	}
}
