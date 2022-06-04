//
//  AvatarCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit

final class AvatarCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : AvatarCollectionCell
    public var viewModel: AvatarCollectionCellViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> AvatarCollectionCellBuilder {
        let cell      = AvatarCollectionCell.create(with: collection, with: indexPath)
        let viewModel = AvatarCollectionCellViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = AvatarCollectionCellBuilder(with: cell,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: AvatarCollectionCell, with viewModel: AvatarCollectionCellViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

