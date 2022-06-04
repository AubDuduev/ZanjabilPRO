//
//  DishCategoryCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit

final class DishCategoryCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : DishCategoryCollectionCell
    public var viewModel: DishCategoryViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> DishCategoryCollectionCellBuilder {
        let cell      = DishCategoryCollectionCell.create(with: collection, with: indexPath)
        let viewModel = DishCategoryViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = DishCategoryCollectionCellBuilder(with: cell,
                                                            with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: DishCategoryCollectionCell, with viewModel: DishCategoryViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

