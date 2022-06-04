//
//  MainCollectionViewsBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit
// It is responsible for creating all Builder for Collection Views
final class MainCollectionViewsBuilder {
    
    public func createMenuCollectionViewBuilder() -> MenuCollectionViewBuilder {
        let menuCollectionViewBuilder = MenuCollectionViewBuilder.create()
        menuCollectionViewBuilder.viewModel.model = .getMenu
        return menuCollectionViewBuilder
    }
    
    public func createInputAddressCollectionViewBuilder() -> InputAddressCollectionViewBuilder {
        let inputAddressCollectionViewBuilder = InputAddressCollectionViewBuilder.create()
        return inputAddressCollectionViewBuilder
    }
    
    public func createPayOrderCollectionViewBuilder() -> PayOrderCollectionViewBuilder {
        let payOrderCollectionViewBuilder = PayOrderCollectionViewBuilder.create()
        return payOrderCollectionViewBuilder
    }
    
    public func createMenuCategoriesViewBuilder() -> MenuCategoriesViewBuilder {
        let menuCategoriesViewBuilder = MenuCategoriesViewBuilder.create()
        return menuCategoriesViewBuilder
    }
    
    public func createBasketCollectionViewBuilder() -> BasketCollectionViewBuilder {
        let basketCollectionViewBuilder = BasketCollectionViewBuilder.create()
        basketCollectionViewBuilder.viewModel.model = .getMenu
        return basketCollectionViewBuilder
    }
    
    public func createProfileCollectionViewBuilder() -> ProfileCollectionViewBuilder {
        let profileCollectionViewBuilder = ProfileCollectionViewBuilder.create()
        return profileCollectionViewBuilder
    }
    
    public func createAddressesCollectionViewBuilder() -> AddressesCollectionViewBuilder {
        let addressesCollectionViewBuilder = AddressesCollectionViewBuilder.create()
        return addressesCollectionViewBuilder
    }
    
    public func createOrdersCollectionViewBuilder() -> OrdersCollectionViewBuilder {
        let ordersCollectionViewBuilder = OrdersCollectionViewBuilder.create()
        return ordersCollectionViewBuilder
    }
	
	public func createAddressSuggestionsCollectionViewBuilder() -> AddressSuggestionsCollectionViewBuilder {
		let addressSuggestionsCollectionViewBuilder = AddressSuggestionsCollectionViewBuilder.create()
		return addressSuggestionsCollectionViewBuilder
	}
}
