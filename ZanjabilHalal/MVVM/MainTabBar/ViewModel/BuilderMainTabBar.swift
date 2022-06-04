//
//  BuilderMainTabBar.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 12.03.2022.
//
import Resolver
import UIKit

final class MainTabBarViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : MainTabBarViewController
    public var viewModel: MainTabBarViewModel
    
    public static func create() -> MainTabBarViewControllerBuilder {
        let view      = MainTabBarViewController()
        let viewModel = MainTabBarViewModel(with: view)
        viewModel.bindMainView(with: view)
        view.loadViewIfNeeded()
        viewModel.model = .setupTabBarView
        let selfBuilder = MainTabBarViewControllerBuilder(with: view,
                                                          with: viewModel)
        return selfBuilder
    }
    
    private init(with view: MainTabBarViewController, with viewModel: MainTabBarViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

