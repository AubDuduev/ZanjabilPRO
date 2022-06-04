//
//  OrdersCollectionView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import UIKit

final class OrdersCollectionView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let orders: [DECOrder]
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var collectionView: UICollectionView!
    
    private let collection = OrdersCollection()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.collection.update(with: viewProperties)
        self.setupCollectionView()
    }
    private func setupCollectionView() {
        let collectionViewLayout                           = OrdersCollectionViewLayout()
        collectionViewLayout.sectionInset                  = .init(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = 0
        collectionViewLayout.minimumInteritemSpacing       = 0
        collectionViewLayout.scrollDirection               = .vertical
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout           = collectionViewLayout
        self.collectionView.delegate                       = self.collection
        self.collectionView.dataSource                     = self.collection
        self.collectionView.reloadData()
    }
    
    // MARK: - create view
    static func create() -> OrdersCollectionView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! OrdersCollectionView
        return view
    }
}
