//
//  BuilderWarning.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Resolver
import UIKit

final class WarningViewBuilder {
    
    public let view     : WarningView
    public let viewModel: WarningViewModel
    
    public static func create() -> WarningViewBuilder {
        let view      = WarningView.create()
        let viewModel = WarningViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = WarningViewBuilder(with: view,
                                             with: viewModel)
        return selfBuilder
    }
    
    private init(with view: WarningView, with viewModel: WarningViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

