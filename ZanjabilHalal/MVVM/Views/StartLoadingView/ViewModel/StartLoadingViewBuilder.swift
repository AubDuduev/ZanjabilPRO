//
//  StartLoadingViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 02.05.2022.
//
import Resolver
import UIKit

final class StartLoadingViewBuilder: BuilderViewProtocol {
    
    public var view     : StartLoadingView
    public var viewModel: StartLoadingViewModel
    
    public static func create() -> StartLoadingViewBuilder {
        let view      = StartLoadingView.create()
        let viewModel = StartLoadingViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = StartLoadingViewBuilder(with: view,
                                                  with: viewModel)
        return selfBuilder
    }
    
    private init(with view: StartLoadingView, with viewModel: StartLoadingViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

