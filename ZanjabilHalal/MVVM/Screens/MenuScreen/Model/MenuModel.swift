//
//  MenuModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit

enum MenuModel {
   
    case createViewProperties
    case addMenuCollectionContainerView(UIView)
    case addBlurHeaderView(UIView)
    case addDishCategoriesView(UIView)
    case addSwitchMenuView(UIView)
    case switchMenuState(MenuState)
    case addLoading
}

