//
//  ChangeAddressModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 04.06.2022.
//
import UIKit
import CoreLocation

enum ChangeAddressModel {
    
    case createViewProperties
	case setupYandexMapCameraListenerService
	case addAddressCollectionView(UIView)
	case didTapSearchAddress
	case updateAddress(DECYandexGEOObject)
}
