//
//  BasketCollectionViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import UIKit

final class BasketCollectionViewBuilder: BuilderViewProtocol {
    
    public var view     : BasketCollectionView
    public var viewModel: BasketCollectionViewModel
    
    public static func create() -> BasketCollectionViewBuilder {
        let view      = BasketCollectionView.create()
        let viewModel = BasketCollectionViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = BasketCollectionViewBuilder(with: view,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with view: BasketCollectionView, with viewModel: BasketCollectionViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

