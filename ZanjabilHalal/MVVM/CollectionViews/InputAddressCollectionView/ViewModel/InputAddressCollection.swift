//
//  InputAddressCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit
import Resolver

final class InputAddressCollection: NSObject {
    //DI
    @Injected
    private var mainCellsBuilder: MainCellsBuilder
    
    var viewProperties: InputAddressCollectionView.ViewProperties?
    
    public func update(with viewProperties: InputAddressCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - Delegate CollectionView
extension InputAddressCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
//MARK: - DataSource CollectionView
extension InputAddressCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return InputAddressCollectionViewType.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let inputAddressCollectionViewType = InputAddressCollectionViewType.allCases[indexPath.row]
        switch inputAddressCollectionViewType {
			case .city, .street, .build, .apartment, .floor, .intercom:
				let inputAddressType = self.viewProperties!.inputAddressTypes[inputAddressCollectionViewType.rawValue]
                let collectionCellBuilder = self.mainCellsBuilder.createInputAddressCollectionCellBuilder(with: collectionView, with: indexPath)
                collectionCellBuilder.viewModel.model = .createViewProperties(inputAddressType)
                return collectionCellBuilder.view
			case .setDefaultAddress:
                let collectionCellBuilder = self.mainCellsBuilder.createDefaultAddressCollectionCellBuilder(with: collectionView, with: indexPath)
                let isDefault = viewProperties?.address?.isDefault ?? false
                collectionCellBuilder.viewModel.model = .createViewProperties(isDefault: isDefault)
                return collectionCellBuilder.view
        }
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension InputAddressCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let inputAddressCollectionViewType = InputAddressCollectionViewType.allCases[indexPath.row]
        switch inputAddressCollectionViewType {
			case .city, .intercom:
                let width : CGFloat = collectionView.bounds.width - 16
                let height: CGFloat = 56
                return .init(width: width, height: height)
            case .street, .build, .apartment, .floor:
                let width : CGFloat = (collectionView.bounds.width / 2) - 12
                let height: CGFloat = 56
                return .init(width: width, height: height)
			case .setDefaultAddress:
                let width : CGFloat = collectionView.bounds.width - 8
                let height: CGFloat = 32
                return .init(width: width, height: height)
        }
    }
}
