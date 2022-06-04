//
//  BuilderOrders.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import Resolver
import UIKit

final class OrdersViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : OrdersViewController
    public var viewModel: OrdersViewModel
    
    public static func create() -> OrdersViewControllerBuilder {
        let viewController = OrdersViewController()
        let viewModel      = OrdersViewModel(with: viewController)
        viewController.loadViewIfNeeded()
        viewModel.bindMainView(with: viewController)
        let selfBuilder = OrdersViewControllerBuilder(with: viewController,
                                                      with: viewModel)
        return selfBuilder
    }
    
    private init(with viewController: OrdersViewController, with viewModel: OrdersViewModel) {
        self.view      = viewController
        self.viewModel = viewModel
    }
}

