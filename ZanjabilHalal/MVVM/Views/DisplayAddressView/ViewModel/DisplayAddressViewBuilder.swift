//
//  DisplayAddressViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.06.2022.
//
import Resolver
import UIKit

final class DisplayAddressViewBuilder: BuilderViewProtocol {
    
    public var view     : DisplayAddressView
    public var viewModel: DisplayAddressViewModel
    
    public static func create() -> DisplayAddressViewBuilder {
        let view      = DisplayAddressView.create()
        let viewModel = DisplayAddressViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = DisplayAddressViewBuilder(with: view,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with view: DisplayAddressView, with viewModel: DisplayAddressViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

