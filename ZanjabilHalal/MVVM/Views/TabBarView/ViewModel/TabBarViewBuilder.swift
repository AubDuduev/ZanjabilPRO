//
//  TabBarViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import Resolver
import UIKit

final class TabBarViewBuilder: BuilderViewProtocol {
    
    public var view     : TabBarView
    public var viewModel: TabBarViewModel
    
    public static func create() -> TabBarViewBuilder {
        let view      = TabBarView.create()
        let viewModel = TabBarViewModel(with: view)
        viewModel.bindView(with: view)
        let selfBuilder = TabBarViewBuilder(with: view,
                                            with: viewModel)
        return selfBuilder
    }
    
    private init(with view: TabBarView, with viewModel: TabBarViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

