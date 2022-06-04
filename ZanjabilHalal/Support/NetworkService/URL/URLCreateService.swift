//
//  URLCreateCustom.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

final class URLCreateService {
   
   let urlHost = URLHostService()
   
   struct Custom {
      
      let path      : String
      let scheme    : URLSchemeService.Scheme
      let host      : String
      let queryItems: [URLQueryItem]?
      
      init(scheme: URLSchemeService.Scheme = .https, host: String, path: String, queryItems: [URLQueryItem]? = nil) {
         
         self.path       = path
         self.scheme     = scheme
         self.host       = host
         self.queryItems = queryItems
      }
   }
   public func create(type: Custom) -> ReturnURL {
      var components = URLComponents()
      components.scheme     = type.scheme.rawValue
      components.host       = type.host
      components.path       = type.path
      components.queryItems = type.queryItems
      guard let url = components.url else {
         fatalError("Error URL no url")
      }
      return (components.url?.absoluteString, url)
   }
}
