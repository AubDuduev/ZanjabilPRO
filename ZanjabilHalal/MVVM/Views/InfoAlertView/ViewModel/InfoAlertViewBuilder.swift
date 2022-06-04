//
//  InfoAlertViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import Resolver
import UIKit

final class InfoAlertViewBuilder: BuilderViewProtocol {
    
    public var view     : InfoAlertView
    public var viewModel: InfoAlertViewModel
    
    public static func create() -> InfoAlertViewBuilder {
        let view      = InfoAlertView.create()
        let viewModel = InfoAlertViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = InfoAlertViewBuilder(with: view,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with view: InfoAlertView, with viewModel: InfoAlertViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

