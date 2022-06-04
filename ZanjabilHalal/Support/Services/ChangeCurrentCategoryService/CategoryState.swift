//
//  CategoryState.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.05.2022.
//
import UIKit

enum CategoryState {
	
	case choice
	case none
	
	public func color() -> UIColor {
		switch self {
			case .choice:
				return .set(.greenFore)
			case .none:
				return .white
		}
	}
}
