//
//  ProfileCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.04.2022.
//
import UIKit

final class ProfileCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : ProfileCollectionCell
    public var viewModel: ProfileCollectionCellViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> ProfileCollectionCellBuilder {
        let cell      = ProfileCollectionCell.create(with: collection, with: indexPath)
        let viewModel = ProfileCollectionCellViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = ProfileCollectionCellBuilder(with: cell,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: ProfileCollectionCell, with viewModel: ProfileCollectionCellViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

