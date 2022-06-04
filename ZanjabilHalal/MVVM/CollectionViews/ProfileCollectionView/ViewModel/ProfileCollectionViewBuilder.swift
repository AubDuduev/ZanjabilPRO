//
//  ProfileCollectionViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.04.2022.
//
import Resolver
import UIKit

final class ProfileCollectionViewBuilder: BuilderViewProtocol {
    
    public var view     : ProfileCollectionView
    public var viewModel: ProfileCollectionViewModel
    
    public static func create() -> ProfileCollectionViewBuilder {
        let view      = ProfileCollectionView.create()
        let viewModel = ProfileCollectionViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = ProfileCollectionViewBuilder(with: view,
                                                       with: viewModel)
        return selfBuilder
    }
    
    private init(with view: ProfileCollectionView, with viewModel: ProfileCollectionViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

