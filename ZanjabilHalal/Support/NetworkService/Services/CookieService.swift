//
//  CookieService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit

final class CookieService {
   
   static let shared = CookieService()
   
   func remove(){
      HTTPCookieStorage.shared.cookies?.forEach(HTTPCookieStorage.shared.deleteCookie)
      URLCache.shared.removeAllCachedResponses()
      let cookieJar = HTTPCookieStorage.shared
      
      for cookie in cookieJar.cookies! {
         cookieJar.deleteCookie(cookie)
      }
   }
}
