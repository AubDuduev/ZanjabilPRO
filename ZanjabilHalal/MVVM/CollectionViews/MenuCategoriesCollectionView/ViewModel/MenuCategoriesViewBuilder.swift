//
//  CategoryMenuViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import Resolver
import UIKit

final class MenuCategoriesViewBuilder: BuilderViewProtocol {
    
    public var view     : MenuCategoriesView
    public var viewModel: MenuCategoriesViewModel
    
    public static func create() -> MenuCategoriesViewBuilder {
        let view      = MenuCategoriesView.create()
        let viewModel = MenuCategoriesViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = MenuCategoriesViewBuilder(with: view,
                                                    with: viewModel)
        return selfBuilder
    }
    
    private init(with view: MenuCategoriesView, with viewModel: MenuCategoriesViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

