//
//  ConfiguratorMenu.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Resolver
import UIKit

final class ConfiguratorMenu {
    
    //MARK: - Public variable
    private unowned let VM: MenuViewModel
    @Injected
    private var mainViewsBuilder          : MainViewsBuilder
    @Injected
    private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    
    public func createMenuCollectionViewBuilder(with containerView: UIView) -> MenuCollectionViewModel {
        let menuCollectionViewBuilder = self.mainCollectionViewsBuilder.createMenuCollectionViewBuilder()
        let menuCollectionView        = menuCollectionViewBuilder.view
        containerView.addSubview(menuCollectionView)
        menuCollectionView.snp.makeConstraints { menuCollectionView in
            menuCollectionView.edges.equalToSuperview()
        }
        return menuCollectionViewBuilder.viewModel
    }
    
    public func createMenuCategoriesViewModel(with containerView: UIView) -> MenuCategoriesViewModel {
        let menuCategoriesViewBuilder = self.mainCollectionViewsBuilder.createMenuCategoriesViewBuilder()
        let menuCategoriesView        = menuCategoriesViewBuilder.view
        containerView.addSubview(menuCategoriesView)
        menuCategoriesView.snp.makeConstraints { menuCategoriesView in
            menuCategoriesView.edges.equalToSuperview()
        }
        return menuCategoriesViewBuilder.viewModel
    }
    
    public func switchMenuView(with container: UIView) {
        let completionMenuState: Closure<MenuState> = { menuState in
            self.VM.model = .switchMenuState(menuState)
        }
        let switchMenuViewBuilder = self.mainViewsBuilder.createSwitchMenuViewBuilder(with: completionMenuState)
        let switchMenuView        = switchMenuViewBuilder.view
        container.addSubview(switchMenuView)
        switchMenuView.snp.makeConstraints { switchMenuView in
            switchMenuView.edges.equalToSuperview()
        }
    }
    
    //MARK: - Inition
    init(with viewModel: MenuViewModel) {
        self.VM = viewModel
    }
}
