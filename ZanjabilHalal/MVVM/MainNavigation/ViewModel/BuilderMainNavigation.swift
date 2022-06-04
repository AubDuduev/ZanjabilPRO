//
//  BuilderMainNavigation.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Resolver
import UIKit

final class MainNavigationViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : MainNavigationViewController
    public var viewModel: MainNavigationViewModel
    
    public static func create(with rootViewController: UIViewController) -> MainNavigationViewControllerBuilder {
        let view       = MainNavigationViewController()
        view.loadViewIfNeeded()
        view.pushViewController(rootViewController, animated: false)
        let viewModel            = MainNavigationViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = MainNavigationViewControllerBuilder(with: view,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with view: MainNavigationViewController, with viewModel: MainNavigationViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

