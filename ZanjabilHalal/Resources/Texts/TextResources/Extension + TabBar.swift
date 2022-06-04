//
//  Extension + TabBar.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Foundation

extension TextResources {
    
    struct TabBar {
        
        enum Text: String, CaseIterable {
            
            case Menu    = "Меню"
            case Basket  = "Карзина"
            case Profile = "Профиль"
            
            func localizedString() -> String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
    }
}
