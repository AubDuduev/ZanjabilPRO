//
//  URLYandexCheckPrice.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation
//Getting prepay delivery price
//https://b2b.taxi.yandex.net/b2b/cargo/integration/v1/check-price
final class URLYandexCheckPrice: URLCreateProtocol {
	
	private var urlPath    = URLPath()
	private var urls       = URLStaticString()
	private var host       = URLHostService()
	private var urlScheme  = URLSchemeService()
	private var custom     = URLCreateService()
	private var parameters = URLParameters()
	
	public func create(with data: Any? = nil) -> ReturnURL? {
		let path       = self.urlPath.create(change: .deliveryCheckPrice(.b2b, .cargo, .integration, .v1, .checkPrice))
		let host       = self.host.create(.Static(.yandexDelivery))
		let customURL  = self.custom.create(type: .init(scheme: .https, host: host, path: path))
		let url        = URL(string: customURL.string ?? "")
		return (customURL.string, url)
	}
}
