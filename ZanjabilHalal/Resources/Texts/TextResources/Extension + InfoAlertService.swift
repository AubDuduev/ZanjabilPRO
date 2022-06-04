//
//  Extension + InputAddressCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Foundation

extension TextResources {
    
    struct InfoAlertService {
        
        enum Names: String, CaseIterable {
            
            case paySuccess = "Ваша оплата прошла, дождитесь звонка для подтверждения заказа"
           
            func localizedString() -> String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
    }
}
