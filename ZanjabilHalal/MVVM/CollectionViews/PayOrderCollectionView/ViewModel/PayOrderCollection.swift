//
//  PayOrderCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit
import Resolver

final class PayOrderCollection: NSObject {
    
    //DI
    @Injected
    private var mainCellsBuilder: MainCellsBuilder
   
    var viewProperties: PayOrderCollectionView.ViewProperties?
    
    public func update(with viewProperties: PayOrderCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - Delegate CollectionView
extension PayOrderCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
//MARK: - DataSource CollectionView
extension PayOrderCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.payOrderCollectionCells.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let payOrderCollectionCell = self.viewProperties!.payOrderCollectionCells[indexPath.row]
        let collectionCellBuilder  = self.mainCellsBuilder.createPayOrderCollectionCellBuilder(with: collectionView, with: indexPath)
        collectionCellBuilder.viewModel.model = .createViewProperties(payOrderCollectionCell)
        return collectionCellBuilder.view
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension PayOrderCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        switch self.viewProperties!.payOrderCollectionCells[indexPath.row] {
			case .map:
				let width : CGFloat = collectionView.bounds.width - 16
				let height: CGFloat = 164
				return .init(width: width, height: height)
            case .inputOfAddress:
                let width : CGFloat = collectionView.bounds.width
                let height: CGFloat = 292
                return .init(width: width, height: height)
            case .payInfoCost, .payInfoDelivery:
                let width : CGFloat = collectionView.bounds.width
                let height: CGFloat = 32
                return .init(width: width, height: height)
            case .totalPrice:
                let width : CGFloat = collectionView.bounds.width
                let height: CGFloat = 48
                return .init(width: width, height: height)
            default:
                let width : CGFloat = collectionView.bounds.width
                let height: CGFloat = 0
                return .init(width: width, height: height)
        }
    }
}


