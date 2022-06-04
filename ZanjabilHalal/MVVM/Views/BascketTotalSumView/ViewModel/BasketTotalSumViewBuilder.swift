//
//  BasketTotalSumViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import Resolver
import UIKit

final class BasketTotalSumViewBuilder: BuilderViewProtocol {
    
    public var view     : BasketTotalSumView
    public var viewModel: BasketTotalSumViewModel
    
    public static func create() -> BasketTotalSumViewBuilder {
        let view      = BasketTotalSumView.create()
        let viewModel = BasketTotalSumViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = BasketTotalSumViewBuilder(with: view,
                                                    with: viewModel)
        return selfBuilder
    }
    
    private init(with view: BasketTotalSumView, with viewModel: BasketTotalSumViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

