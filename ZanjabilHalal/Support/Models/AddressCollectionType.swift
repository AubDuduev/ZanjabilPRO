//
//  AddressCollectionType.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//

import Foundation

enum AddressCollectionType {
	
	case edit
	case display
	
	public func isHiddenButton() -> Bool {
		
		switch self {
			case .edit:
				return false
			case .display:
				return true
		}
	}
}
