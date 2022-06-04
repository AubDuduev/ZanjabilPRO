//
//  MapCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.05.2022.
//
import UIKit

final class MapCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : MapCollectionCell
    public var viewModel: MapCollectionCellViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> MapCollectionCellBuilder {
        let cell      = MapCollectionCell.create(with: collection, with: indexPath)
        let viewModel = MapCollectionCellViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = MapCollectionCellBuilder(with: cell,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: MapCollectionCell, with viewModel: MapCollectionCellViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

