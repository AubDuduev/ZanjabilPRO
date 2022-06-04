//
//  InputAddressViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import UIKit

final class InputAddressCollectionViewBuilder: BuilderViewProtocol {
    
    public var view     : InputAddressCollectionView
    public var viewModel: InputAddressCollectionViewModel
    
    public static func create() -> InputAddressCollectionViewBuilder {
        let view      = InputAddressCollectionView.create()
        let viewModel = InputAddressCollectionViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = InputAddressCollectionViewBuilder(with: view,
                                                            with: viewModel)
        return selfBuilder
    }
    
    private init(with view: InputAddressCollectionView, with viewModel: InputAddressCollectionViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

