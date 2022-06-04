//
//  BuilderProfile.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Resolver
import UIKit

final class ProfileViewControllerBuilder: BuilderViewProtocol {
    
    public var view     : ProfileViewController
    public var viewModel: ProfileViewModel
    
    public static func create() -> ProfileViewControllerBuilder {
        let view      = ProfileViewController()
        let viewModel = ProfileViewModel(with: view)
        view.loadViewIfNeeded()
        viewModel.bindMainView(with: view)
        let selfBuilder = ProfileViewControllerBuilder(with: view,
                                                       with: viewModel)
        return selfBuilder
    }
    
    private init(with view: ProfileViewController, with viewModel: ProfileViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

