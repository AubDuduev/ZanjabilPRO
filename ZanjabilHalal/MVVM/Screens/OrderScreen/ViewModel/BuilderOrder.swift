//
//  BuilderOrder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Resolver
import UIKit

final class OrderViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : OrderViewController
    public var viewModel: OrderViewModel
    
    public static func create() -> OrderViewControllerBuilder {
        let view      = OrderViewController()
        let viewModel = OrderViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = OrderViewControllerBuilder(with: view,
                                                     with: viewModel)
        return selfBuilder
    }
    
    private init(with view: OrderViewController, with viewModel: OrderViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

