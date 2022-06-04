//
//  BascketInfoViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import Resolver
import UIKit

final class BascketInfoViewBuilder: BuilderViewProtocol {
    
    public var view     : BascketInfoView
    public var viewModel: BascketInfoViewModel
    
    public static func create() -> BascketInfoViewBuilder {
        let view      = BascketInfoView.create()
        let viewModel = BascketInfoViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = BascketInfoViewBuilder(with: view,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with view: BascketInfoView, with viewModel: BascketInfoViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

