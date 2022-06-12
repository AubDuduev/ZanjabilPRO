//
//  CenterMapPinViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.06.2022.
//
import Resolver
import UIKit

final class CenterMapPinViewBuilder: BuilderViewProtocol {
    
    public var view     : CenterMapPinView
    public var viewModel: CenterMapPinViewModel
    
    public static func create() -> CenterMapPinViewBuilder {
        let view      = CenterMapPinView.create()
        let viewModel = CenterMapPinViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = CenterMapPinViewBuilder(with: view,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with view: CenterMapPinView, with viewModel: CenterMapPinViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

