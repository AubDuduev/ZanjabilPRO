//
//  MainBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation
import UIKit

// MARK: - It is responsible for creating builders
final class MainViewControllersBuilder {
    
    public func createLoadingBuilder() -> LoadingViewControllerBuilder {
        let loadingViewControllerBuilder = LoadingViewControllerBuilder.create()
        return loadingViewControllerBuilder
    }
   
    public func createMenuBuilder() -> MenuViewControllerBuilder {
        let menuViewControllerBuilder = MenuViewControllerBuilder.create()
        return menuViewControllerBuilder
    }
   
    public func createMainNavigationBuilder(with rootViewController: UIViewController) -> MainNavigationViewControllerBuilder {
        let mainNavigationViewControllerBuilder = MainNavigationViewControllerBuilder.create(with: rootViewController)
        return mainNavigationViewControllerBuilder
    }
   
    public func createMainTabBarBuilder() -> MainTabBarViewControllerBuilder {
        let builderMainTabBarViewController = MainTabBarViewControllerBuilder.create()
        return builderMainTabBarViewController
    }
    
    public func createProfileBuilder() -> ProfileViewControllerBuilder {
        let profileViewControllerBuilder = ProfileViewControllerBuilder.create()
        return profileViewControllerBuilder
    }
   
    public func createOrderBuilder() -> OrderViewControllerBuilder {
        let orderViewControllerBuilder = OrderViewControllerBuilder.create()
        return orderViewControllerBuilder
    }

    public func createBasketBuilder() -> BasketViewControllerBuilder {
        let basketViewControllerBuilder = BasketViewControllerBuilder.create()
        return basketViewControllerBuilder
    }
   
    public func createPayOrderBuilder() -> PayOrderViewControllerBuilder {
        let payOrderViewControllerBuilder = PayOrderViewControllerBuilder.create()
        return payOrderViewControllerBuilder
    }
    
    public func createInputAddressBuilder() -> InputAddressViewControllerBuilder {
        let inputAddressViewControllerBuilder = InputAddressViewControllerBuilder.create()
        return inputAddressViewControllerBuilder
    }
    
    public func createOrdersBuilder() -> OrdersViewControllerBuilder {
        let ordersViewControllerBuilder = OrdersViewControllerBuilder.create()
        return ordersViewControllerBuilder
    }
    
    public func createAddressesBuilder() -> AddressesViewControllerBuilder {
        let addressesViewControllerBuilder = AddressesViewControllerBuilder.create()
        return addressesViewControllerBuilder
    }
	
	public func createChangeUserNameViewControllerBuilder() -> ChangeUserNameViewControllerBuilder {
		let changeUserNameControllerBuilder = ChangeUserNameViewControllerBuilder.create()
		return changeUserNameControllerBuilder
	}
	
	public func createMapScreenViewControllerBuilder() -> MapScreenViewControllerBuilder {
		let mapScreenControllerBuilder = MapScreenViewControllerBuilder.create()
		return mapScreenControllerBuilder
	}
}

