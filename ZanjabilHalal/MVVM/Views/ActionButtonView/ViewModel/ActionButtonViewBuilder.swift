//
//  ActionButtonViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import Resolver
import UIKit

final class ActionButtonViewBuilder: BuilderViewProtocol {
    
    public var view     : ActionButtonView
    public var viewModel: ActionButtonViewModel
    
    public static func create() -> ActionButtonViewBuilder {
        let view      = ActionButtonView.create()
        let viewModel = ActionButtonViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = ActionButtonViewBuilder(with: view,
                                                  with: viewModel)
        return selfBuilder
    }
    
    private init(with view: ActionButtonView, with viewModel: ActionButtonViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

