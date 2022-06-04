//
//  AddDishState.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 26.03.2022.
//
import Foundation

enum HiddenState {
    
    case hidden
    case present
    
    public func state() -> Bool {
        switch self {
            case .present:
                return false
            case .hidden:
                return true
        }
    }
}
