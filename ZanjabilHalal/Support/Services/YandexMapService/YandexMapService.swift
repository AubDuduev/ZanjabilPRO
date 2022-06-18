//
//  YandexMapService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.05.2022.
//
import Combine
import CoreLocation
import Resolver
import YandexMapsMobile
import Foundation

final class YandexMapService: ServiceProtocol {
    
    private let apiKey = "6aa10602-86e0-44f2-ac8b-7df843a57bf4"
	
    public func activate(){
        YMKMapKit.setApiKey(self.apiKey)
		YMKMapKit.sharedInstance().onStart()
    }
}
