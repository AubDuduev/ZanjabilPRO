//
//  ChangeAddressModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 04.06.2022.
//
import UIKit

enum ChangeAddressModel {
    
    case createViewProperties
	case setupGeoPositioningService
	case addAddressCollectionView(UIView)
	case didTapSearchAddress
	case updateAddress(String)
}
