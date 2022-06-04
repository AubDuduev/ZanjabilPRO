//
//  MenuCollectionModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit

enum MenuCollectionModel {
    
    case createViewProperties
    case updateViewProperties(listMenu: [DECMenu], menuState: MenuState)
    case switchMenuState(menuState: MenuState)
	case scrollToCategory(DECCategory)
    case getMenu
}
