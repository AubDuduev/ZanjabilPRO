//
//  BuilderAddresses.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import Resolver
import UIKit

final class AddressesViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : AddressesViewController
    public var viewModel: AddressesViewModel
    
    public static func create() -> AddressesViewControllerBuilder {
        let viewController = AddressesViewController()
        let viewModel      = AddressesViewModel(with: viewController)
        viewModel.bindMainView(with: viewController)
        let selfBuilder = AddressesViewControllerBuilder(with: viewController,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with viewController: AddressesViewController, with viewModel: AddressesViewModel) {
        self.view      = viewController
        self.viewModel = viewModel
    }
}

