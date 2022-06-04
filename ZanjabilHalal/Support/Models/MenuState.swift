//
//  MenuState.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 26.03.2022.
//
import UIKit

enum MenuState: Int {
    case vertical
    case horizontal
    
    public func scrollDirection() -> UICollectionView.ScrollDirection {
        switch self {
            case .vertical:
                return .vertical
            case .horizontal:
                return .horizontal
        }
    }
    
    public func isPagingEnabled() -> Bool {
        switch self {
            case .vertical:
                return false
            case .horizontal:
                return true
        }
    }
    
    public func buttonColorState() -> (active: UIColor, noActive: UIColor) {
        switch self {
            case .vertical:
                return (.set(.greenFore), .white)
            case .horizontal:
                return (.white, .set(.greenFore))
        }
    }
    
    public func minimumLineSpacing() -> CGFloat {
        switch self {
            case .vertical:
                return 8
            case .horizontal:
                return 0
        }
    }
    
    public func minimumInteritemSpacing() -> CGFloat {
        switch self {
            case .vertical:
                return 0
            case .horizontal:
                return 0
        }
    }
    
    public func sectionInset() -> UIEdgeInsets  {
        switch self {
            case .vertical:
                return .init(top: 16, left: 0, bottom: 0, right: 0)
            case .horizontal:
                return .init(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

