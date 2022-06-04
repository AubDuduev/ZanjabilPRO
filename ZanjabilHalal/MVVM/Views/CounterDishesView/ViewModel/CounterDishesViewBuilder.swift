//
//  BuilderCounterDishesView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.04.2022.
//
import Resolver
import UIKit

final class CounterDishesViewBuilder: BuilderViewProtocol {
    
    public var view     : CounterDishesView
    public var viewModel: CounterDishesViewModel
    
    public static func create() -> CounterDishesViewBuilder {
        let view      = CounterDishesView.create()
        let viewModel = CounterDishesViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = CounterDishesViewBuilder(with: view,
                                                   with: viewModel)
        return selfBuilder
    }
    
    private init(with view: CounterDishesView, with viewModel: CounterDishesViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

