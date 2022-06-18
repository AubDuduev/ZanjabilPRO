//
//  YandexMapViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Resolver
import UIKit

final class YandexMapViewBuilder: BuilderViewProtocol {
    
    public var view     : YandexMapView
    public var viewModel: YandexMapViewModel
    
    public static func create() -> YandexMapViewBuilder {
        let view      = YandexMapView.create()
        let viewModel = YandexMapViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = YandexMapViewBuilder(with: view,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with view: YandexMapView, with viewModel: YandexMapViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

