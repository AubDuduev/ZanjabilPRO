//
//  MenuCollectionCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit

final class MenuCollectionViewBuilder: BuilderViewProtocol {
    
    public var view     : MenuCollectionView
    public var viewModel: MenuCollectionViewModel
    
    public static func create() -> MenuCollectionViewBuilder {
        let view      = MenuCollectionView.create()
        let viewModel = MenuCollectionViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = MenuCollectionViewBuilder(with: view,
                                                    with: viewModel)
        return selfBuilder
    }
    
    private init(with view: MenuCollectionView, with viewModel: MenuCollectionViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

