//
//  PayOrderCollectionViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import UIKit

final class PayOrderCollectionViewBuilder: BuilderViewProtocol {
    
    public var view     : PayOrderCollectionView
    public var viewModel: PayOrderCollectionViewModel
    
    public static func create() -> PayOrderCollectionViewBuilder {
        let view      = PayOrderCollectionView.create()
        let viewModel = PayOrderCollectionViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = PayOrderCollectionViewBuilder(with: view,
                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with view: PayOrderCollectionView, with viewModel: PayOrderCollectionViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

