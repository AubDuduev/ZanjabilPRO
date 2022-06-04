//
//  AddAddressViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import Resolver
import UIKit

final class AddAddressViewBuilder: BuilderViewProtocol {
    
    public var view     : AddAddressView
    public var viewModel: AddAddressViewModel
    
    public static func create() -> AddAddressViewBuilder {
        let view      = AddAddressView.create()
        let viewModel = AddAddressViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = AddAddressViewBuilder(with: view,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with view: AddAddressView, with viewModel: AddAddressViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

