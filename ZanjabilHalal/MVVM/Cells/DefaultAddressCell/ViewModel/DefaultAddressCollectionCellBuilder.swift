//
//  DefaultAddressCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import UIKit

final class DefaultAddressCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : DefaultAddressCollectionCell
    public var viewModel: DefaultAddressCollectionCellViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> DefaultAddressCollectionCellBuilder {
        let cell      = DefaultAddressCollectionCell.create(with: collection, with: indexPath)
        let viewModel = DefaultAddressCollectionCellViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = DefaultAddressCollectionCellBuilder(with: cell,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: DefaultAddressCollectionCell, with viewModel: DefaultAddressCollectionCellViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

