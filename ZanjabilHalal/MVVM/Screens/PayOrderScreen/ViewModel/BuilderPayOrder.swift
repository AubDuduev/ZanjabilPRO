//
//  BuilderPayOrder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import Resolver
import UIKit

final class PayOrderViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : PayOrderViewController
    public var viewModel: PayOrderViewModel
    
    public static func create() -> PayOrderViewControllerBuilder {
        let view      = PayOrderViewController()
        let viewModel = PayOrderViewModel(with: view)
        view.loadViewIfNeeded()
        viewModel.bindMainView(with: view)
        let selfBuilder = PayOrderViewControllerBuilder(with: view,
                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with view: PayOrderViewController, with viewModel: PayOrderViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

