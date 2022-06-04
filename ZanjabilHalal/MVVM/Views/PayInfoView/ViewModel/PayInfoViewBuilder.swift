//
//  PayInfoViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import UIKit

final class PayInfoViewBuilder: BuilderViewProtocol {
    
    public var view     : PayInfoView
    public var viewModel: PayInfoViewModel
    
    public static func create() -> PayInfoViewBuilder {
        let view      = PayInfoView.create()
        let viewModel = PayInfoViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = PayInfoViewBuilder(with: view,
                                             with: viewModel)
        return selfBuilder
    }
    
    private init(with view: PayInfoView, with viewModel: PayInfoViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

