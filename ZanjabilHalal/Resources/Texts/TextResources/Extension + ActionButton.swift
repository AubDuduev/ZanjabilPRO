//
//  Extension + ActionButton.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Foundation

extension TextResources {
    
    struct ActionButton {
        
        enum Titles: String, CaseIterable {
            
            case pay  = "Оплатить"
            case save = "Сохранить"
            case edit = "Изменить"
			case add  = "Добавить"
            
            func localizedString() -> String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
    }
}
