//
//  AddressSuggestionsCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import UIKit
import Resolver

final class AddressSuggestionsCollection: NSObject {
   
    @Injected
    private var mainCellsBuilder: MainCellsBuilder
	
	private var viewProperties: AddressSuggestionsCollectionView.ViewProperties?
    
	public func update(with viewProperties: AddressSuggestionsCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - Delegate CollectionView
extension AddressSuggestionsCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
//MARK: - DataSource CollectionView
extension AddressSuggestionsCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.collectionCells ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let addressSuggestion = self.viewProperties!.decAddressSuggestions[indexPath.row]
        let collectionCellBuilder = self.mainCellsBuilder.createAddressSuggestionCollectionCellBuilder(with: collectionView, with: indexPath)
		collectionCellBuilder.viewModel.model = .createViewProperties(addressSuggestion)
        return collectionCellBuilder.view
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension AddressSuggestionsCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width : CGFloat = collectionView.bounds.width
        let height: CGFloat = 32
        return .init(width: width, height: height)
    }
}


