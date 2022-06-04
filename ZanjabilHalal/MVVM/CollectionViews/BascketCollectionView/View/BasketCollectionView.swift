//
//  BasketCollectionView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit

final class BasketCollectionView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
       
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    // MARK: - create view
    static func create() -> BasketCollectionView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! BasketCollectionView
        return view
    }
}
