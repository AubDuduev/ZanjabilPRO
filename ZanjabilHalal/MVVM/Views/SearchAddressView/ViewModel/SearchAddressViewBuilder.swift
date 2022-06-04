//
//  SearchAddressViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import Resolver
import UIKit

final class SearchAddressViewBuilder: BuilderViewProtocol {
    
    public var view     : SearchAddressView
    public var viewModel: SearchAddressViewModel
    
    public static func create() -> SearchAddressViewBuilder {
        let view      = SearchAddressView.create()
        let viewModel = SearchAddressViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = SearchAddressViewBuilder(with: view,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with view: SearchAddressView, with viewModel: SearchAddressViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

