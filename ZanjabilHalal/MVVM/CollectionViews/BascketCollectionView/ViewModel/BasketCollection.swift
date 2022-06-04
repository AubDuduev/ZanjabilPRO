//
//  BasketCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit

final class BasketCollection: NSObject {
    
    struct ViewProperties {
        let collectionCells: [VerticalDishCollectionCell]
    }
    var viewProperties: ViewProperties?
    
    public func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - Delegate CollectionView
extension BasketCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
//MARK: - DataSource CollectionView
extension BasketCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.collectionCells.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.viewProperties!.collectionCells[indexPath.row]
        return cell
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension BasketCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = collectionView.bounds.width - 16
        let height: CGFloat = 120
        return .init(width: width, height: height)
    }
}


