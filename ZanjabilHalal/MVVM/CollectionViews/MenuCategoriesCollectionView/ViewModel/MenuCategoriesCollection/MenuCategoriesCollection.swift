//
//  MenuCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 19.03.2022.
//
import UIKit
import Resolver

final class MenuCategoriesCollection : NSObject {
	//DI
	@Injected
	private var mainCellsBuilder: MainCellsBuilder
    
	var viewProperties: MenuCategoriesView.ViewProperties?
    
	public func update(with viewProperties: MenuCategoriesView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - Delegate CollectionView
extension MenuCategoriesCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
//MARK: - DataSource CollectionView
extension MenuCategoriesCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = self.viewProperties!.categories[indexPath.row]
		let dishCategoryCollectionCellBuilder = self.mainCellsBuilder.createDishCategoryCollectionCellBuilder(with: collectionView, with: indexPath)
		dishCategoryCollectionCellBuilder.viewModel.model = .createViewProperties(category, indexPath)
		return dishCategoryCollectionCellBuilder.view
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension MenuCategoriesCollection: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let category        = self.viewProperties!.categories[indexPath.row]
        let width : CGFloat = category.name.widthText(plus: 70)
        let height: CGFloat = 36
        return .init(width: width, height: height)
    }
}


