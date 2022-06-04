//
//  BuilderMenu.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Resolver
import UIKit

final class MenuViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : MenuViewController
    public var viewModel: MenuViewModel
    
    public static func create() -> MenuViewControllerBuilder {
        let view      = MenuViewController()
        let viewModel = MenuViewModel(with: view)
        view.loadViewIfNeeded()
        view.viewDidLoad()
        viewModel.bindMainView(with: view)
        let selfBuilder = MenuViewControllerBuilder(with: view,
                                                    with: viewModel)
        return selfBuilder
    }
    
    private init(with view: MenuViewController, with viewModel: MenuViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

