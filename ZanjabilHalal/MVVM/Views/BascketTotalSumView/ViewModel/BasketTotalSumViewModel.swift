//
//  BasketTotalSumViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import Foundation
import Resolver
import Combine

final class BasketTotalSumViewModel: MVVMViewModelProtocol {
    
    public var model: BasketTotalSumModel? {
        didSet { self.stateBasketTotalSumModel() }
    }
    //DI
    @Injected
    private var localBasketService: LocalBasketService
    @Injected
    private var menuService       : MenuService
    //Private 
    private var cancellable: Set<AnyCancellable> = []
    //MARK: - implementation protocol
    public var mainView: BasketTotalSumView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateBasketTotalSumModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let listMenu):
                let viewProperties = self.createViewProperties(with: listMenu)
                self.mainView?.update(with: viewProperties)
            case .getMenu:
                self.menuService.subscribeUpdateMenu
                    .sink { [weak self] listMenu in
                        guard let self = self else { return }
                        self.model = .createViewProperties(listMenu)
                    }
                    .store(in: &self.cancellable)
        }
    }
    
    private func createViewProperties(with menuList: [DECMenu]) -> BasketTotalSumView.ViewProperties {
        var allDishes = menuList.compactMap{ $0.dishes }.flatMap{ $0 }
        let products  = self.localBasketService.getProducts()
        allDishes = allDishes.filter({ dish in
            return products.contains(where: { (dish.ID! == $0.id!) && ($0.count != 0) } )
        })
        let countDishes = allDishes.count
        let sum         = self.localBasketService.getTotalPrice()
        let dishName    = self.endingWordDishes(countDishes)
        let text        = "\(countDishes) \(dishName) на сумму \(sum) ₽"
        let viewProperties = BasketTotalSumView.ViewProperties(countsDishesText: text)
        return viewProperties
    }
    
    private func dishesCount(with dishID: String?) -> Decimal {
        let products = localBasketService.getProducts()
        let count = products.first(where: { $0.id == dishID} )?.count ?? 0
        let result = Decimal(count)
        return result
    }
    
    private func endingWordDishes(_ productCount: Int?) -> String {
        guard let productCount = productCount else { return "блюда"}
        switch true {
            case (productCount % 5) == 0:
                return "блюд"
            case (productCount % 5) == 1:
                return "блюдо"
            case (productCount % 5) == 2:
                return "блюда"
            case (productCount % 5) == 3:
                return "блюда"
            case (productCount % 5) == 4:
                return "блюда"
            default:
                return "блюда"
        }
    }
    
    init(with mainView: BasketTotalSumView) {
        self.mainView = mainView
    }
}
