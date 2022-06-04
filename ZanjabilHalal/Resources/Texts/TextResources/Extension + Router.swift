//
//  Extension + Router.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import Foundation

extension TextResources {
    
    struct Router {
        
        enum NavigationTitle: String, CaseIterable {
            
            case payOrder  = "Оплата и доставка"
            case orders    = "Мои заказы"
            case addresses = "Мои адреса"
            case empty     = ""
            
            func localizedString() -> String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
    }
}
