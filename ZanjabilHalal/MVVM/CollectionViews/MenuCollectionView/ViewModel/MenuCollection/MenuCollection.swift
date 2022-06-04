//
//  MenuCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit
import Resolver

final class MenuCollection: NSObject {
    
    @Injected
    private var mainCellsBuilder: MainCellsBuilder
	
	var viewProperties: MenuCollectionView.ViewProperties?
	
	func update(with viewProperties: MenuCollectionView.ViewProperties?) {
		self.viewProperties = viewProperties
	}
}
//MARK: - Delegate CollectionView
extension MenuCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
//MARK: - DataSource CollectionView
extension MenuCollection: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewProperties?.countSection ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.menuList[section].dishes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dish = self.viewProperties!.menuList[indexPath.section].dishes![indexPath.row]
        switch self.viewProperties!.menuState {
            case .vertical:
                let verticalDishCollectionCellBuilder = self.mainCellsBuilder.createVerticalDishCollectionCellBuilder(with: collectionView, with: indexPath)
                verticalDishCollectionCellBuilder.viewModel.model = .createViewProperties(dish)
                return verticalDishCollectionCellBuilder.view
            case .horizontal:
                let horizontalDishCollectionCellBuilder = self.mainCellsBuilder.createHorizontalDishCollectionCellBuilder(with: collectionView, with: indexPath)
                horizontalDishCollectionCellBuilder.viewModel.model = .createViewProperties(dish)
                return horizontalDishCollectionCellBuilder.view
        }
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension MenuCollection: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.viewProperties!.menuState {
            case .vertical:
                let width : CGFloat = collectionView.bounds.width - 16
                let height: CGFloat = 120
                return .init(width: width, height: height)
            case .horizontal:
                let width : CGFloat = collectionView.bounds.width 
                let height: CGFloat = collectionView.bounds.height
                return .init(width: width, height: height)
        }
    }
}


