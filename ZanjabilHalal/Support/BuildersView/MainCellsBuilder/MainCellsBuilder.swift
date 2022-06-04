//
//  MainCellsBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit
//It is responsible of creating Collection Cells
final class MainCellsBuilder {
    
    public func createVerticalDishCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> VerticalDishCollectionCellBuilder {
        let verticalDishCollectionCellBuilder = VerticalDishCollectionCellBuilder.create(with: collection, with: indexPath)
        return verticalDishCollectionCellBuilder
    }
    
    public func createHorizontalDishCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> HorizontalDishCollectionCellBuilder {
        let horizontalDishCollectionCellBuilder = HorizontalDishCollectionCellBuilder.create(with: collection, with: indexPath)
        return horizontalDishCollectionCellBuilder
    }
    
    public func createDishCategoryCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> DishCategoryCollectionCellBuilder {
        let dishCategoryCollectionCellBuilder = DishCategoryCollectionCellBuilder.create(with: collection, with: indexPath)
        return dishCategoryCollectionCellBuilder
    }
    
    public func createInputAddressCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> InputAddressCellBuilder {
        let inputAddressCellBuilder = InputAddressCellBuilder.create(with: collection, with: indexPath)
        return inputAddressCellBuilder
    }
    
    public func createPayOrderCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> PayOrderCollectionCellBuilder {
        let payOrderCellBuilder = PayOrderCollectionCellBuilder.create(with: collection, with: indexPath)
        return payOrderCellBuilder
    }
    
    public func createProfileCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> ProfileCollectionCellBuilder {
        let profileCellBuilder = ProfileCollectionCellBuilder.create(with: collection, with: indexPath)
        return profileCellBuilder
    }
    
    public func createAvatarCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> AvatarCollectionCellBuilder {
        let avatarCellBuilder = AvatarCollectionCellBuilder.create(with: collection, with: indexPath)
        return avatarCellBuilder
    }
    
    public func createAddressCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> AddressCollectionCellBuilder {
        let addressCellBuilder = AddressCollectionCellBuilder.create(with: collection, with: indexPath)
        return addressCellBuilder
    }
    
    public func createOrderCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> OrderCollectionCellBuilder {
        let orderCellBuilder = OrderCollectionCellBuilder.create(with: collection, with: indexPath)
        return orderCellBuilder
    }
    
    public func createDefaultAddressCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> DefaultAddressCollectionCellBuilder {
        let defaultAddressCellBuilder = DefaultAddressCollectionCellBuilder.create(with: collection, with: indexPath)
        return defaultAddressCellBuilder
    }
	
	public func createMapCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> MapCollectionCellBuilder {
		let mapCellBuilder = MapCollectionCellBuilder.create(with: collection, with: indexPath)
		return mapCellBuilder
	}
	
	public func createAddressSuggestionCollectionCellBuilder(with collection: UICollectionView, with indexPath: IndexPath) -> AddressSuggestionCollectionCellBuilder {
		let addressSuggestionCellBuilder = AddressSuggestionCollectionCellBuilder.create(with: collection, with: indexPath)
		return addressSuggestionCellBuilder
	}
}

