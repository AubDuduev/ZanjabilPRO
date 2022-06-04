//
//  Extension + Profile.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Foundation

extension TextResources {
    
    struct Profile {
        
        enum Text: String, CaseIterable {
            
            case card      = "Мои способы оплаты"
            case orders    = "История заказов"
            case name      = "Имя"
            case addresses = "Адреса"
            
            func localizedString() -> String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
    }
}
