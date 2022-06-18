//
//  YandexMapModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import UIKit
import YandexMapsMobile

enum YandexMapModel {
    
    case createViewProperties
    case setupGeoPositioningService
	case updateCameraPosition(YMKCameraPosition)
}
