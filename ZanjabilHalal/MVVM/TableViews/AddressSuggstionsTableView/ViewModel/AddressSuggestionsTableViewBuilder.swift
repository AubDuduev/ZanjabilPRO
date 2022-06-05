//
//  AddressSuggestionsTableViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import Resolver
import UIKit

final class AddressSuggestionsTableViewBuilder: BuilderViewProtocol {
    
    public var view     : AddressSuggestionsTableView
    public var viewModel: AddressSuggestionsTableViewModel
    
    public static func create() -> AddressSuggestionsTableViewBuilder {
        let view      = AddressSuggestionsTableView.create()
        let viewModel = AddressSuggestionsTableViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = AddressSuggestionsTableViewBuilder(with: view,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with view: AddressSuggestionsTableView, with viewModel: AddressSuggestionsTableViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

