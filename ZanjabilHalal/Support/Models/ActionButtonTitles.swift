//
//  ActionButtonTitles.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import Foundation

private typealias R = TextResources.ActionButton

enum ActionButtonType {
    
    case payOrder
    case editAddress
    case saveAddress
    
    public func title() -> String {
        
        switch self {
            case .payOrder:
                return R.Titles.pay.localizedString()
            case .editAddress:
                return R.Titles.edit.localizedString()
            case .saveAddress:
                return R.Titles.save.localizedString()
        }
    }
}
