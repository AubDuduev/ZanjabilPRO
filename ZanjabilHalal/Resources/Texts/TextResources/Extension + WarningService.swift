//
//  Extension + WarningService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Foundation

extension TextResources {
    
    struct WarningService {
        
        enum Names: String, CaseIterable {
            
            case build     = "Введите номер дома"
            case city      = "Введите название города"
            case apartment = "Введите номер квартиры"
            case floor     = "Введите номер этажа"
            case intercom  = "Введите номер домофона"
            case street    = "Введите название улицы"
            
            func localizedString() -> String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
    }
}
