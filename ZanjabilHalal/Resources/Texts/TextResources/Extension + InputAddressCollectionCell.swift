//
//  Extension + InputAddressCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Foundation

extension TextResources {
    
    struct InputAddressCollectionCell {
        
        enum Text: String, CaseIterable {
            
            case attributedPlaceholder = "Обязательно"
            
            func localizedString() -> String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
        
        enum Names: String, CaseIterable {
            
            case city      = "Город"
            case street    = "Улица"
            case build     = "Дом"
            case apartment = "Квартира"
            case floor     = "Этаж"
            case intercom  = "Домофон"
            
            func localizedString() -> String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
    }
}
