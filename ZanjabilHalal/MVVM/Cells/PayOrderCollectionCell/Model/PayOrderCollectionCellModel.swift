//
//  PayOrderCollectionCellModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import UIKit

enum PayOrderCollectionCellModel {
    
    case createViewProperties(PayOrderCollectionCells)
    case createInputAddressCollectionViewModel(UIView, DECAddress?)
    case createMapViewModel(UIView)
	case createPayInfoCostViewModel(UIView)
    case createPayInfoDeliveryViewModel(UIView)
    case createPayInfoTotalPriceViewModel(UIView)
}

