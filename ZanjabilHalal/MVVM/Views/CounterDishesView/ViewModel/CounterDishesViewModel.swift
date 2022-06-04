//
//  CounterDishesViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 02.04.2022.
//
import Resolver
import Foundation

final class CounterDishesViewModel: MVVMViewModelProtocol {
    
    public var mainView: CounterDishesView?
    public var isUpdate: ClosureEmpty?
    
    public var modelCounterDishes: CounterDishesModel? {
        didSet { self.logicCounterDishesModel() }
    }
    //DI
    @Injected
    private var localBasketService: LocalBasketService
    @Injected
    private var menuService       : MenuService
    //logic model
    private func logicCounterDishesModel(){
        guard let model = self.modelCounterDishes else { return }
        switch model {
            //создание свойств view
            case .createViewProperties(let dish):
                let didActionCounterDishes: ClosureTwo<ActionAddRemove, Int> = { action, counter in
                    self.increaseCounterDishesView(with: action, dish: dish)
                }
                let counterString  = localBasketService.getCount(with: dish)
                let counter        = Int(counterString) ?? 0
                let viewProperties = CounterDishesView.ViewProperties(dish         : dish,
                                                                      counter      : counter,
                                                                      counterString: counterString,
                                                                      hiddenState  : .present,
                                                                      didActionCounterDishes: didActionCounterDishes)
                self.updateMainView(with: viewProperties)
            //обновление свойств view
            case .updateViewProperties(let counter):
                self.mainView?.viewProperties?.counterString = "\(counter)"
                self.updateMainView(with: self.mainView?.viewProperties)
                self.isUpdate?()
        }
        
    }
    
    private func increaseCounterDishesView(with action: ActionAddRemove, dish: DECDish) {
        switch action {
            case .remove:
                guard self.mainView?.viewProperties?.counter != 0 else { return }
                self.mainView?.viewProperties?.counter -= 1
                self.localBasketService.removeDish(with: dish)
            case .add:
                self.mainView?.viewProperties?.counter += 1
                self.localBasketService.addDish(with: dish)
        }
        let counter = self.mainView?.viewProperties?.counter ?? 0
        self.modelCounterDishes = .updateViewProperties(counter)
        self.menuService.updateSubscribers()
    }
    
    init(with mainView: CounterDishesView) {
        self.mainView = mainView
    }
}
