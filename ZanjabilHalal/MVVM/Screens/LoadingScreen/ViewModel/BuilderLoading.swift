//
//  BuilderLoading.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Resolver
import UIKit

final class LoadingViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : LoadingViewController
    public var viewModel: LoadingViewModel
    
    public static func create() -> LoadingViewControllerBuilder {
        let view      = LoadingViewController()
        let viewModel = LoadingViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = LoadingViewControllerBuilder(with: view,
                                                       with: viewModel)
        return selfBuilder
    }
    
    private init(with view: LoadingViewController, with viewModel: LoadingViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}
