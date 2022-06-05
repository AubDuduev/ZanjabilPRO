//
//  AddressesCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit
import Resolver

final class AddressesCollection: NSObject {
   
    @Injected
    private var mainCellsBuilder: MainCollectionCellsBuilder

    var viewProperties: AddressesCollectionView.ViewProperties?
    
    public func update(with viewProperties: AddressesCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - Delegate CollectionView
extension AddressesCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
//MARK: - DataSource CollectionView
extension AddressesCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewProperties?.addresses.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCellBuilder = self.mainCellsBuilder.createAddressCollectionCellBuilder(with: collectionView, with: indexPath)
        let address = viewProperties!.addresses[indexPath.row]
		let addressCollectionType = viewProperties!.addressCollectionType
		collectionCellBuilder.viewModel.model = .createViewProperties(address, addressCollectionType)
        return collectionCellBuilder.view
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension AddressesCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = collectionView.bounds.width
        let height: CGFloat = 56
        return .init(width: width, height: height)
    }
}


