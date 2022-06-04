//
//  BasketModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import UIKit

enum BasketModel {
    
    case createViewProperties
    case addedBasketCollectionView(UIView)
    case addBlurHeaderView(UIView)
    case addBuyView(UIView)
    case addBasketTotalSumView(UIView)
    // MARK: - Router
    case pushPayOrderVC
}
