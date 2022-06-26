//
//  URLYandexReverseGeocoding.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

//https://geocode-maps.yandex.ru/1.x/?apikey={apikey}&geocode=lat,long&format=json&results=1

final class URLYandexReverseGeocoding: URLCreateProtocol {
	
	private var urlPath    = URLPath()
	private var urls       = URLStaticString()
	private var host       = URLHostService()
	private var urlScheme  = URLSchemeService()
	private var custom     = URLCreateService()
	private var parameters = URLParameters()
	
	public func create(with data: Any? = nil) -> ReturnURL? {
		let parameters = data as! ParametersYandexReverseGeocoding
		let queryItems = self.parameters.create(queryItems: .yandexReverseGeocoding(parameters))
		let path       = self.urlPath.create(change: .yandexReverseGeocoding(.oneX))
		let host       = self.host.create(.Static(.yandexGeocoding))
		let customURL  = self.custom.create(type: .init(scheme: .https, host: host, path: path, queryItems: queryItems))
		let url        = URL(string: customURL.string ?? "")
		return (customURL.string, url)
	}
}
