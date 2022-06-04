//
//  Extension + PayInfoView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Foundation

extension TextResources {
    
    struct PayInfoView {
        
        enum Names: String, CaseIterable {
            
            case cost      = "Стоймость"
            case delivery  = "Доставка"
            case total     = "Итого"
            
            func localizedString() -> String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
    }
}
