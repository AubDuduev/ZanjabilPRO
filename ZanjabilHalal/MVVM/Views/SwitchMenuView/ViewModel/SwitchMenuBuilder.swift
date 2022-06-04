//
//  BuilderSwitchMenu.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.04.2022.
//
import Resolver
import UIKit

final class SwitchMenuViewBuilder: BuilderViewProtocol {
  
    public var view     : SwitchMenuView
    public var viewModel: SwitchMenuViewModel
    
    public static func create() -> SwitchMenuViewBuilder {
        let view      = SwitchMenuView.create()
        let viewModel = SwitchMenuViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = SwitchMenuViewBuilder(with: view,
                                                with: viewModel)
        return selfBuilder
    }
    
    private init(with view: SwitchMenuView, with viewModel: SwitchMenuViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}
