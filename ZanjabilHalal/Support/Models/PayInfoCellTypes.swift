//
//  PayInfoCellTypes.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//

import Foundation
import UIKit

private typealias R = TextResources.PayInfoView

enum PayInfoCellTypes {
    
    case cost(String)
    case delivery(String)
    case total(String)
    
    public func title() -> String {
        
        switch self {
            case .cost:
                return R.Names.cost.localizedString()
            case .delivery:
                return R.Names.delivery.localizedString()
            case .total:
                return R.Names.total.localizedString()
        }
    }
    
    public func info() -> String {
        
        switch self {
            case .cost(let name):
                return name
            case .delivery(let name):
                return name
            case .total(let name):
                return name
        }
    }
    
    public func titleFont() -> UIFont {
        
        switch self {
            case .cost:
                return UIFont.set(.rubikLight, 14)
            case .delivery:
                return UIFont.set(.rubikLight, 14)
            case .total:
                return UIFont.set(.rubikRegular, 23)
        }
    }
    
    public func infoFont() -> UIFont {
        
        switch self {
            case .cost:
                return UIFont.set(.rubikLight, 14)
            case .delivery:
                return UIFont.set(.rubikLight, 14)
            case .total:
                return UIFont.set(.rubikRegular, 23)
        }
    }
    
    public func infoButtonHidden() -> Bool {
        
        switch self {
            case .cost:
                return false
            case .delivery:
                return false
            case .total:
                return true
        }
    }
}
