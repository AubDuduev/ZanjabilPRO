//
//  InputAddressTypes.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit

private typealias R = TextResources.InputAddressCollectionCell

enum InputAddressTypes {
    
    case city(String?, Bool)
    case street(String?)
    case build(String?)
    case apartment(String?)
    case floor(String?)
    case intercom(String?)
    
    public func title() -> String {
        
        switch self {
            case .city:
                return R.Names.city.localizedString()
            case .street:
                return R.Names.street.localizedString()
            case .build:
                return R.Names.build.localizedString()
            case .apartment:
                return R.Names.apartment.localizedString()
            case .floor:
                return R.Names.floor.localizedString()
            case .intercom:
                return R.Names.intercom.localizedString()
        }
    }
    
    public func name() -> String? {
        
        switch self {
            case .city(let name, _):
                return name
            case .street(let name):
                return name
            case .build(let name):
                return name
            case .apartment(let name):
                return name
            case .floor(let name):
                return name
            case .intercom(let name):
                return name
        }
    }
    
    public func keyboardType() -> UIKeyboardType {
        
        switch self {
            case .city:
                return .default
            case .street:
                return .default
            case .build:
                return .numberPad
            case .apartment:
                return .numberPad
            case .floor:
                return .numberPad
            case .intercom:
                return .numberPad
        }
    }
    
    public func isHiddenAction() -> Bool {
        
        switch self {
            case .city(_ , let isPresentAddresses):
                return isPresentAddresses
            case .street:
                return true
            case .build:
                return true
            case .apartment:
                return true
            case .floor:
                return true
            case .intercom:
                return true
        }
    }
	
	public func isUserInteraction() -> Bool {
		
		switch self {
			case .city:
				return false
			case .street:
				return false
			case .build:
				return true
			case .apartment:
				return true
			case .floor:
				return true
			case .intercom:
				return true
		}
	}
}
