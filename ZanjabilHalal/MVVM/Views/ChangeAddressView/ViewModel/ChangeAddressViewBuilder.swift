//
//  ChangeAddressViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 04.06.2022.
//
import Resolver
import UIKit

final class ChangeAddressViewBuilder: BuilderViewProtocol {
    
    public var view     : ChangeAddressView
    public var viewModel: ChangeAddressViewModel
    
    public static func create() -> ChangeAddressViewBuilder {
        let view      = ChangeAddressView.create()
        let viewModel = ChangeAddressViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = ChangeAddressViewBuilder(with: view,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with view: ChangeAddressView, with viewModel: ChangeAddressViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

