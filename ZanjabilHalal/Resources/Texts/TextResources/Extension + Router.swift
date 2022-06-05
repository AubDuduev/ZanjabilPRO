//
//  Extension + Router.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import Foundation

extension TextResources {
	
	struct Navigation {
		
		enum NavigationTitle: String, CaseIterable {
			
			case payOrder    = "Оплата и доставка"
			case orders      = "Мои заказы"
			case addresses   = "Мои адреса"
			case map         = "Карта"
			case addressList = "Список адресов"
			case empty       = ""
			
			func localizedString() -> String {
				return NSLocalizedString(self.rawValue, comment: "")
			}
		}
		
		enum NavigationButtonTitle: String, CaseIterable {
			
			case back  = "Назад"
			case empty = ""
			
			public func localizedString() -> String {
				return NSLocalizedString(self.rawValue, comment: "")
			}
		}
	}
}

