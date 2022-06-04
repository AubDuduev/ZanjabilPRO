//
//  OrdersCollectionViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import Resolver
import UIKit

final class OrdersCollectionViewBuilder: BuilderViewProtocol {
    
    public var view     : OrdersCollectionView
    public var viewModel: OrdersCollectionViewModel
    
    public static func create() -> OrdersCollectionViewBuilder {
        let view      = OrdersCollectionView.create()
        let viewModel = OrdersCollectionViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = OrdersCollectionViewBuilder(with: view,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with view: OrdersCollectionView, with viewModel: OrdersCollectionViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

