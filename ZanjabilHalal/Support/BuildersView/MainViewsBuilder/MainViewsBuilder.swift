//
//  MainViewsBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 26.03.2022.
//
import UIKit
// It is responsible for creating all Views
final class MainViewsBuilder {
    // MARK: - Builders
    public func createCounterDishesViewBuilder(with dish: DECDish) -> CounterDishesViewBuilder {
        let counterDishesViewBuilder = CounterDishesViewBuilder.create()
        counterDishesViewBuilder.viewModel.modelCounterDishes = .createViewProperties(dish)
        return counterDishesViewBuilder
    }
    
    public func createSwitchMenuViewBuilder(with completionMenuState: @escaping Closure<MenuState>) -> SwitchMenuViewBuilder {
        let switchMenuViewBuilder = SwitchMenuViewBuilder.create()
        switchMenuViewBuilder.viewModel.modelSwitchMenu = .createViewProperties(completionMenuState: completionMenuState)
        return switchMenuViewBuilder
    }
    
    public func createPayInfoViewBuilder() -> PayInfoViewBuilder {
        let payInfoViewBuilder = PayInfoViewBuilder.create()
        return payInfoViewBuilder
    }
    
    public func createWarningViewBuilder(with warningText: WarningTextType) -> WarningViewBuilder {
        let switchMenuViewBuilder = WarningViewBuilder.create()
        let warningText = WarningText(text: warningText.text())
        switchMenuViewBuilder.viewModel.model = .createViewProperties(warningText)
        return switchMenuViewBuilder
    }
    
    public func createActionButtonViewBuilder() -> ActionButtonViewBuilder {
        let actionButtonViewBuilder = ActionButtonViewBuilder.create()
        return actionButtonViewBuilder
    }
    
    public func createBasketTotalSumViewBuilder() -> BasketTotalSumViewBuilder {
        let basketTotalSumViewBuilder = BasketTotalSumViewBuilder.create()
        return basketTotalSumViewBuilder
    }
    
    public func createInfoAlertViewBuilder(with infoAlertDescriptionType: InfoAlertDescriptionType) -> InfoAlertViewBuilder {
        let infoAlertViewBuilder = InfoAlertViewBuilder.create()
        infoAlertViewBuilder.viewModel.model = .createViewProperties(infoAlertDescriptionType)
        return infoAlertViewBuilder
    }
    // MARK: - Views
    private func createMenuPriceView<Properties>(with viewProperties: Properties) -> MenuPriceView {
        let menuPriceView = MenuPriceView.create()
        menuPriceView.viewProperties = MenuPriceView.ViewProperties(price: 500.0)
        return menuPriceView
    }
    
    private func createAddDishView<Properties>(with viewProperties: Properties) -> AddDishView {
        let addDishView = AddDishView.create()
        addDishView.viewProperties = viewProperties as? AddDishView.ViewProperties
        return addDishView
    }
    
    private func createBuyView<Properties>(with viewProperties: Properties) -> BuyView {
        let addDishView = BuyView.create()
        addDishView.viewProperties = viewProperties as? BuyView.ViewProperties
        return addDishView
    }
    
    private func createActionButtonView<Properties>(with viewProperties: Properties) -> ActionButtonView {
        let addDishView = ActionButtonView.create()
        addDishView.viewProperties = viewProperties as? ActionButtonView.ViewProperties
        return addDishView
    }
    
    public func createTabBarViewBuilder() -> TabBarViewBuilder {
        let tabBarViewBuilder = TabBarViewBuilder.create()
        return tabBarViewBuilder
    }
    
    public func createAddAddressViewBuilder() -> AddAddressViewBuilder {
        let addAddressViewBuilder = AddAddressViewBuilder.create()
        addAddressViewBuilder.viewModel.model = .createViewProperties
        return addAddressViewBuilder
    }
    
    public func createStartLoadingViewBuilder() -> StartLoadingViewBuilder {
        let startLoadingViewBuilder = StartLoadingViewBuilder.create()
        startLoadingViewBuilder.viewModel.model = .createViewProperties
        return startLoadingViewBuilder
    }
	
	public func createMapViewBuilder() -> MapViewBuilder {
		let mapViewBuilder = MapViewBuilder.create()
		return mapViewBuilder
	}
	
	public func createSearchAddressViewBuilder() -> SearchAddressViewBuilder {
		let searchAddressViewBuilder = SearchAddressViewBuilder.create()
		searchAddressViewBuilder.viewModel.model = .createViewProperties
		return searchAddressViewBuilder
	}
	
	public func createChangeAddressViewViewBuilder() -> ChangeAddressViewBuilder {
		let changeAddressViewBuilder = ChangeAddressViewBuilder.create()
		changeAddressViewBuilder.viewModel.model = .createViewProperties
		return changeAddressViewBuilder
	}
	
	public func createCenterMapPinViewBuilder() -> CenterMapPinViewBuilder {
		let centerMapPinViewBuilder = CenterMapPinViewBuilder.create()
		centerMapPinViewBuilder.viewModel.model = .createViewProperties
		return centerMapPinViewBuilder
	}
	
	public func createYandexMapViewBuilder() -> YandexMapViewBuilder {
		let yandexMapViewBuilder = YandexMapViewBuilder.create()
		yandexMapViewBuilder.viewModel.model = .createViewProperties
		return yandexMapViewBuilder
	}
    
    enum Views {
        case menuPriceView
        case addDishView
        case buyView
        case actionButton
    }
    
    enum Builders {
        case counterDishesView
        case switchMenuView
    }
    
    public func createView<View: UIView, Properties>(with view: Views, with viewProperties: Properties) -> View {
        switch view {
            case .menuPriceView:
                return self.createMenuPriceView(with: viewProperties) as! View
            case .addDishView:
                return self.createAddDishView(with: viewProperties) as! View
            case .buyView:
                return self.createBuyView(with: viewProperties) as! View
            case .actionButton:
                return self.createActionButtonView(with: viewProperties) as! View
        }
    }
    
//    public func createBuilder<AnyData, BuildType>(with view: Builders, with data: AnyData) -> BuildType {
//        switch view {
//            case .counterDishesView():
//                let dish = data as! DECDish
//                return self.createCounterDishesViewBuilder(with: dish) as! returnType
//            case .switchMenuView:
//                let completionMenuState = data as! Closure<MenuState>
//                return self.createSwitchMenuViewBuilder(with: completionMenuState) as! BuildType
//        }
//    }
}
