//
//  BuilderBasket.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import Resolver
import UIKit

final class BasketViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : BasketViewController
    public var viewModel: BasketViewModel
    
    public static func create() -> BasketViewControllerBuilder {
        let view       = BasketViewController()
        let viewModel  = BasketViewModel(with: view)
        view.loadViewIfNeeded()
        viewModel.bindMainView(with: view)
        let selfBuilder = BasketViewControllerBuilder(with: view,
                                                      with: viewModel)
        return selfBuilder
    }
    
    private init(with view: BasketViewController, with viewModel: BasketViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

