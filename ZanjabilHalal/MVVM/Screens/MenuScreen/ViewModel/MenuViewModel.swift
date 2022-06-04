//
//  MenuViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import AnimatedGradientView
import Resolver
import Foundation
import UIKit

final class MenuViewModel: MVVMViewModelProtocol {
    
    public var model: MenuModel? {
        didSet { self.stateMenuModel() }
    }
    // MARK: - DI
    @Injected
    private var menuService       : MenuService
    @Injected
    private var localBasketService: LocalBasketService
    @Injected
    private var loadingService    : LoadingService
    // MARK: - Private
    private var listMenu                : [DECMenu] = []
    private var addDishView             : AddDishView!
    private var menuPriceView           : MenuPriceView!
    private var counterDishesView       : CounterDishesView!
    private var menuCategoriesCollection: MenuCategoriesCollection!
    private var menuCollectionViewModel : MenuCollectionViewModel!
    private var menuCategoriesViewModel : MenuCategoriesViewModel!
    
    // MARK: - Managers
    lazy private var managers = MenuManagers(with: self)
    // MARK: - View
    public var mainView: MenuViewController?
    public var isUpdate: ClosureEmpty?
    
    private func stateMenuModel(){
        guard let model = self.model else { return }
        
        switch model {
            case .createViewProperties:
                let addMenuCollectionContainerView: Closure<UIView> = { containerView in
                    self.model = .addMenuCollectionContainerView(containerView)
                }
                let addBlurHeaderView: Closure<UIView> = { containerView in
                    self.model = .addBlurHeaderView(containerView)
                }
                let addDishCategoriesView: Closure<UIView> = { containerView in
                    self.model = .addDishCategoriesView(containerView)
                }
                let addSwitchMenuView: Closure<UIView> = { containerView in
                    self.model = .addSwitchMenuView(containerView)
                }
                let viewDidLoad: ClosureEmpty = {
                    
                }
                let viewProperties = MenuViewController.ViewProperties(addMenuCollectionContainerView: addMenuCollectionContainerView,
                                                                       addDishCategoriesView         : addDishCategoriesView,
                                                                       addSwitchMenuView             : addSwitchMenuView,
                                                                       addBlurHeaderView             : addBlurHeaderView,
                                                                       viewDidLoad                   : viewDidLoad)
                self.mainView?.update(with: viewProperties)
            case .addMenuCollectionContainerView(let view):
                self.menuCollectionViewModel = self.managers.configurator.createMenuCollectionViewBuilder(with: view)
                self.menuCollectionViewModel.model = .getMenu
                self.menuCollectionViewModel.model = .createViewProperties
            case .addBlurHeaderView(let containerView):
                self.addBlurHeaderView(with: containerView)
            case .addDishCategoriesView(let view):
                self.menuCategoriesViewModel = self.managers.configurator.createMenuCategoriesViewModel(with: view)
                self.menuCategoriesViewModel.model = .getMenu
            case .addSwitchMenuView(let view):
                self.managers.configurator.switchMenuView(with: view)
            case .addLoading:
                self.loadingService.present(with: .simple, dismiss: false)
            // MARK: - Presentation
            case .switchMenuState(let menuState):
                self.menuCollectionViewModel.model = .switchMenuState(menuState: menuState)
        }
    }
    
    public func addBlurHeaderView(with containerView: UIView){
        let width = UIScreen.main.bounds.width
        let frame = CGRect(x: 0, y: 0, width: width, height: 8)
        let animatedGradient = AnimatedGradientView(frame: frame)
        animatedGradient.direction = .up
        animatedGradient.colors = [[#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]]
        containerView.addSubview(animatedGradient)
    }
    
    init(with mainView: MenuViewController) {
        self.mainView = mainView
    }
}
