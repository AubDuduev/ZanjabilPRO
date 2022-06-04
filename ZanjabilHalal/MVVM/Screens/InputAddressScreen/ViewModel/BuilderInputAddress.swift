//
//  BuilderInputAddress.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import UIKit

final class InputAddressViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : InputAddressViewController
    public var viewModel: InputAddressViewModel
    
    public static func create() -> InputAddressViewControllerBuilder {
        let viewController = InputAddressViewController()
        let viewModel      = InputAddressViewModel(with: viewController)
        viewModel.bindMainView(with: viewController)
        let selfBuilder = InputAddressViewControllerBuilder(with: viewController,
                                                            with: viewModel)
        return selfBuilder
    }
    
    private init(with viewController: InputAddressViewController, with viewModel: InputAddressViewModel) {
        self.view      = viewController
        self.viewModel = viewModel
    }
}

