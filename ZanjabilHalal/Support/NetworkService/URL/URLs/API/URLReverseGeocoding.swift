//
//  URLReverseGeocoding.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 11.06.2022.
//
import Foundation

//https://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address
final class URLReverseGeocoding: URLCreateProtocol {
	
	private var urlPath    = URLPath()
	private var urls       = URLStaticString()
	private var host       = URLHostService()
	private var urlScheme  = URLSchemeService()
	private var custom     = URLCreateService()
	private var parameters = URLParameters()
	
	public func create(with data: Any? = nil) -> ReturnURL? {
		let path       = self.urlPath.create(change: .reverseGeocoding(.suggestions, .api, .foreOne, .rs, .geolocate, .address))
		let host       = self.host.create(.Static(.daDataSuggestion))
		let customURL  = self.custom.create(type: .init(scheme: .https, host: host, path: path))
		let url        = URL(string: customURL.string ?? "")
		return (customURL.string, url)
	}
}
