//
//  InputAddressCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit

final class InputAddressCellBuilder: BuilderViewProtocol {
    
    public var view     : InputAddressCollectionCell
    public var viewModel: InputAddressCellViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> InputAddressCellBuilder {
        let cell      = InputAddressCollectionCell.create(with: collection, with: indexPath)
        let viewModel = InputAddressCellViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = InputAddressCellBuilder(with: cell,
                                                  with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: InputAddressCollectionCell, with viewModel: InputAddressCellViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

