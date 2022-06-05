//
//  ChangeAddressModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 04.06.2022.
//
import UIKit

enum ChangeAddressModel {
    
    case createViewProperties
	case setupLocationService
	case addAddressCollectionView(UIView)
	case didTapSearchAddress
	case updateAddress(String)
}
