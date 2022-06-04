//
//  SwitchMenuModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.04.2022.
//
import UIKit

enum SwitchMenuModel {
    
    case createViewProperties(completionMenuState: Closure<MenuState>)
    case switchMenuState(changeIndex: Int)
}
