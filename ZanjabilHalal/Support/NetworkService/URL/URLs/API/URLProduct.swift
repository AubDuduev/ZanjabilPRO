//
//  File.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 12.03.2022.
//
import Foundation

final class URLProduct: URLCreateProtocol {
    
    private var urlPath    = URLPath()
    private var urls       = URLStaticString()
    private var host       = URLHostService()
    private var urlScheme  = URLSchemeService()
    private var custom     = URLCreateService()
    private var parameters = URLParameters()
    
    
    public func create(with data: Any? = nil) -> ReturnURL? {
        let queryItems = self.parameters.create(queryItems: .none)
        let path       = self.urlPath.create(change: .non)
		let host       = self.host.create(.Static(.daDataSuggestion))
        let customURL  = self.custom.create(type: .init(scheme: .http, host: host, path: path, queryItems: queryItems))
        let url        = URL(string: customURL.string ?? "")
        return (customURL.string, url)
    }
}
