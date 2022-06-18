//
//  VerticalDishCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit

final class VerticalDishCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : VerticalDishCollectionCell
    public var viewModel: VerticalDishViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> VerticalDishCollectionCellBuilder {
        let cell      = VerticalDishCollectionCell.create(with: collection, with: indexPath)
        let viewModel = VerticalDishViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = VerticalDishCollectionCellBuilder(with: cell,
                                                            with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: VerticalDishCollectionCell, with viewModel: VerticalDishViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

