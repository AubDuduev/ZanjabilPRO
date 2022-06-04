//
//  OrdersCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import UIKit
import Resolver

final class OrdersCollection: NSObject {
   
    @Injected
    private var mainCellsBuilder: MainCellsBuilder
    
    private var viewProperties: OrdersCollectionView.ViewProperties?
    
    public func update(with viewProperties: OrdersCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - Delegate CollectionView
extension OrdersCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewProperties?.orders.count ?? 0
    }
}
//MARK: - DataSource CollectionView
extension OrdersCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.orders[section].dishes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCellBuilder = self.mainCellsBuilder.createOrderCollectionCellBuilder(with: collectionView, with: indexPath)
        let decOrder = self.viewProperties!.orders[indexPath.section].dishes![indexPath.row]
        collectionCellBuilder.viewModel.model = .createViewProperties(decOrder)
        return collectionCellBuilder.view
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = OrderCollectionHeader.create(collectionView, ofKind: kind, indexPath: indexPath)
        let order  = self.viewProperties!.orders[indexPath.section]
        let viewProperties = OrderCollectionHeader.ViewProperties(order: order)
        header.update(with: viewProperties)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width : CGFloat = collectionView.bounds.width
        let height: CGFloat = 37
        return .init(width: width, height: height)
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension OrdersCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = collectionView.bounds.width
        let height: CGFloat = 37
        return .init(width: width, height: height)
    }
}


