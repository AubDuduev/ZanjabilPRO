//
//  AddressesCollectionViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import Resolver
import UIKit

final class AddressesCollectionViewBuilder: BuilderViewProtocol {
    
    public var view     : AddressesCollectionView
    public var viewModel: AddressesCollectionViewModel
    
    public static func create() -> AddressesCollectionViewBuilder {
        let view      = AddressesCollectionView.create()
        let viewModel = AddressesCollectionViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = AddressesCollectionViewBuilder(with: view,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with view: AddressesCollectionView, with viewModel: AddressesCollectionViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

