//
//  AddressSuggestionsCollectionViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import Resolver
import UIKit

final class AddressSuggestionsCollectionViewBuilder: BuilderViewProtocol {
    
    public var view     : AddressSuggestionsCollectionView
    public var viewModel: AddressSuggestionsCollectionViewModel
    
    public static func create() -> AddressSuggestionsCollectionViewBuilder {
        let view      = AddressSuggestionsCollectionView.create()
        let viewModel = AddressSuggestionsCollectionViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = AddressSuggestionsCollectionViewBuilder(with: view,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with view: AddressSuggestionsCollectionView, with viewModel: AddressSuggestionsCollectionViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

