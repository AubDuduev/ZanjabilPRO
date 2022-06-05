//
//  AddressCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit

final class AddressCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : AddressCollectionCell
    public var viewModel: AddressCollectionCellViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> AddressCollectionCellBuilder {
        let cell      = AddressCollectionCell.create(with: collection, with: indexPath)
        let viewModel = AddressCollectionCellViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = AddressCollectionCellBuilder(with: cell,
                                                       with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: AddressCollectionCell, with viewModel: AddressCollectionCellViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

