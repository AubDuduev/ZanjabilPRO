//
//  ErrorViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Resolver
import UIKit

final class ErrorViewBuilder {
    
    public let view     : ErrorView
    public let viewModel: ErrorViewModel
    
    public static func create() -> ErrorViewBuilder {
        let view      = ErrorView()
        let viewModel = ErrorViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = ErrorViewBuilder(with: view,
                                           with: viewModel)
        return selfBuilder
    }
    
    private init(with view: ErrorView, with viewModel: ErrorViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

