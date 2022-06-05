//
//  VerticalMenuViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit
import Resolver

final class VerticalDishViewModel: MVVMViewModelProtocol {
    
    public var model: VerticalMenuModel? {
        didSet { self.logicVerticalMenuModel() }
    }
    //MARK: - View
    public var mainView: VerticalDishCollectionCell?
    public var isUpdate: ClosureEmpty?
    @Injected
    private var mainViewsBuilder: MainViewsBuilder
    
    private func logicVerticalMenuModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let dish):
                let addCounterDishesView: ClosureTwo<UIView, DECDish> = { container, dish in
                    self.counterDishesView(with: container, dish: dish)
                }
                let addMenuPriceView: ClosureTwo<UIView, DECDish> = { container, dish in
                    self.menuPriceView(with: container, with: dish)
                }
                let addDishView: ClosureTwo<UIView, DECDish> = { container, dish in
                    self.addDishView(with: container, with: dish)
                }
                let viewProperties = VerticalDishCollectionCell.ViewProperties(dish                : dish,
                                                                               addCounterDishesView: addCounterDishesView,
                                                                               addMenuPriceView    : addMenuPriceView,
                                                                               addDishView         : addDishView)
                self.mainView?.update(with: viewProperties)
            case .updateViewProperties:
                print("") 
        }
    }
    
    public func counterDishesView(with container: UIView, dish: DECDish) {
        let counterDishesViewBuilder = self.mainViewsBuilder.createCounterDishesViewBuilder(with: dish)
        let counterDishesView        = counterDishesViewBuilder.view
        container.addSubview(counterDishesView)
        counterDishesView.snp.makeConstraints { counterDishesView in
            counterDishesView.left.equalTo(container)
            counterDishesView.top.equalTo(container)
            counterDishesView.bottom.equalTo(container)
            counterDishesView.width.equalTo(100)
        }
    }
    
    public func menuPriceView(with container: UIView, with dish: DECDish) {
        let dishPrice      = dish.price ?? 0.0
        let viewProperties = MenuPriceView.ViewProperties(price: dishPrice)
        let menuPriceView  = self.mainViewsBuilder.createView(with: .menuPriceView, with: viewProperties) as! MenuPriceView
        menuPriceView.update(with: viewProperties)
        container.addSubview(menuPriceView)
        menuPriceView.snp.makeConstraints { menuPriceView in
            menuPriceView.left.equalTo(container)
            menuPriceView.top.equalTo(container)
            menuPriceView.bottom.equalTo(container)
            menuPriceView.width.equalTo(100)
        }
    }
    
    public func addDishView(with container: UIView, with dish: DECDish) {
        let didTapAddDish: Closure<DECDish> = { [weak self] dish in
            guard let self = self else { return }
            //self.VM.modelMenu = .addDish(dish)
        }
        let viewProperties = AddDishView.ViewProperties(dish         : dish,
                                                        didTapAddDish: didTapAddDish,
                                                        hiddenState  : .hidden)
        let addDishView = self.mainViewsBuilder.createView(with: .addDishView, with: viewProperties) as! AddDishView
        addDishView.update(with: viewProperties)
        container.addSubview(addDishView)
        addDishView.snp.makeConstraints { addDishView in
            addDishView.edges.equalToSuperview()
        }
    }
    
    init(with mainView: VerticalDishCollectionCell) {
        self.mainView = mainView
    }
}
