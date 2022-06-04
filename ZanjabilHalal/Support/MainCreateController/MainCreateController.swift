//
//  MainCreateController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit
import Resolver

final class MainCreateController {
    // MARK: - DI
    @Injected
    private var mainViewControllersBuilder: MainViewControllersBuilder
    // MARK: - VC
    lazy public var navigationViewController: MainNavigationViewController = self.createMainNavigationViewController(id: .tabBarVC)
    lazy public var tabBarViewController    : MainTabBarViewController     = self.createMainTabBarViewController()
    lazy public var payOrderViewController  : PayOrderViewController       = self.createPayOrderViewController()
    
    // MARK: - Создаем основной навигационный контроллер
    private func createMainNavigationViewController(id controllerID: ControllersID) -> MainNavigationViewController {
        let rootViewController          = self.createVC(id: controllerID)
        let createMainNavigationBuilder = self.mainViewControllersBuilder.createMainNavigationBuilder(with: rootViewController)
        let navigationViewController   = createMainNavigationBuilder.view
        return navigationViewController
    }
    // MARK: - Создаем контроллер с меню
    private func createMenuViewController() -> MenuViewController {
        let menuBuilder             = self.mainViewControllersBuilder.createMenuBuilder()
        menuBuilder.viewModel.model = .createViewProperties
        let menuViewController      = menuBuilder.view
        return menuViewController
    }
    // MARK: - Создаем контроллер профиля
    private func createProfileViewController() -> ProfileViewController {
        let profileBuilder             = self.mainViewControllersBuilder.createProfileBuilder()
        profileBuilder.viewModel.model = .createViewProperties
        let profileViewController = profileBuilder.view
        return profileViewController
    }
    // MARK: - Создаем загрузочный контроллер
    private func createLoadingViewController() -> LoadingViewController {
        let loadingBuilder             = self.mainViewControllersBuilder.createLoadingBuilder()
        loadingBuilder.viewModel.model = .createViewProperties
        let loadingViewController = loadingBuilder.view
        return loadingViewController
    }
    // MARK: - Создаем основной TabBar
    private func createMainTabBarViewController() -> MainTabBarViewController {
        let tabBarBuilder        = self.mainViewControllersBuilder.createMainTabBarBuilder()
        tabBarBuilder.viewModel.model = .createViewProperties
        tabBarBuilder.viewModel.model = .addStartLoadingView
        let tabBarViewController = tabBarBuilder.view
        return tabBarViewController
    }
    // MARK: - Создаем контроллер заказов
    private func createOrderViewController() -> OrderViewController {
        let orderBuilder        = self.mainViewControllersBuilder.createOrderBuilder()
        let orderViewController = orderBuilder.view
        return orderViewController
    }
    // MARK: - Создаем контроллер корзины
    private func createBasketViewController() -> BasketViewController {
        let basketBuilder             = self.mainViewControllersBuilder.createBasketBuilder()
        basketBuilder.viewModel.model = .createViewProperties
        let basketViewController = basketBuilder.view
        return basketViewController
    }
    // MARK: - Создаем контроллер оплаты заказа
    private func createPayOrderViewController() -> PayOrderViewController {
        let payOrderBuilder             = self.mainViewControllersBuilder.createPayOrderBuilder()
        payOrderBuilder.viewModel.model = .createViewProperties
        return payOrderBuilder.view
    }
    // MARK: - Создаем контроллер для ввода адреса
    private func createInputAddressViewController(with address: DECAddress?, with actionButtonType: ActionButtonType) -> InputAddressViewController {
        let inputAddressViewControllerBuilder = self.mainViewControllersBuilder.createInputAddressBuilder()
        inputAddressViewControllerBuilder.viewModel.model = .createViewProperties(address, actionButtonType)
        let inputAddressViewController = inputAddressViewControllerBuilder.view
        return inputAddressViewController
    }
    // MARK: - Создаем контроллер со списком заказов
    private func createOrdersViewController() -> OrdersViewController {
        let ordersViewControllerBuilder = self.mainViewControllersBuilder.createOrdersBuilder()
        ordersViewControllerBuilder.viewModel.model = .createViewProperties
        let ordersViewController = ordersViewControllerBuilder.view
        return ordersViewController
    }
    // MARK: - Создаем контроллер со списком адресов
    private func createAddressesViewController() -> AddressesViewController {
        let addressesViewControllerBuilder = self.mainViewControllersBuilder.createAddressesBuilder()
        addressesViewControllerBuilder.viewModel.model = .createViewProperties
        let addressesViewController = addressesViewControllerBuilder.view
        return addressesViewController
    }
	// MARK: - Create controller of ChangeUserNameViewController
	private func createChangeUserNameViewController() -> ChangeUserNameViewController {
		let changeUserNameViewControllerBuilder = self.mainViewControllersBuilder.createChangeUserNameViewControllerBuilder()
		changeUserNameViewControllerBuilder.viewModel.model = .createViewProperties
		let changeUserNameViewController = changeUserNameViewControllerBuilder.view
		return changeUserNameViewController
	}
	// MARK: - Create controller of MapScreen
	private func createMapScreenViewController() -> MapScreenViewController {
		let mapScreenViewControllerBuilder = self.mainViewControllersBuilder.createMapScreenViewControllerBuilder()
		mapScreenViewControllerBuilder.viewModel.model = .createViewProperties
		mapScreenViewControllerBuilder.viewModel.model = .setupLocationService
		let mapScreenViewController = mapScreenViewControllerBuilder.view
		return mapScreenViewController
	}
    // MARK: - Создаем контроллеры для переходов
    public func createVC<T: UIViewController>(id controllerID: ControllersID) -> T {
        switch controllerID {
            case .menuVC:
                return self.createMenuViewController() as! T
            case .loadingVC:
                return self.createLoadingViewController() as! T
            case .tabBarVC:
                return self.tabBarViewController as! T
            case .mainNavigationVC:
                return self.navigationViewController as! T
            case .profileVC:
                return self.createProfileViewController() as! T
            case .orderVC:
                return self.createOrderViewController() as! T
            case .basketVC:
                return self.createBasketViewController() as! T
            case .payOrderVC:
                return self.payOrderViewController as! T
            case .inputAddressVC(let address, let actionButtonType):
                return self.createInputAddressViewController(with: address, with: actionButtonType) as! T
            case .ordersVC:
                return self.createOrdersViewController() as! T
            case .addressesVC:
                return self.createAddressesViewController() as! T
			case .changeUserNameVC:
				return self.createChangeUserNameViewController() as! T
			case .mapScreenVC:
				return self.createMapScreenViewController() as! T
        }
    }
    
    enum ControllersID {
        case menuVC
        case loadingVC
        case tabBarVC
        case profileVC
        case orderVC
        case basketVC
        case payOrderVC
        case inputAddressVC(DECAddress?, ActionButtonType)
        case mainNavigationVC
        case ordersVC
        case addressesVC
		case changeUserNameVC
		case mapScreenVC
    }
}
