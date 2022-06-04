//
//  HorizontalMenuCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit

final class HorizontalDishCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : HorizontalDishCollectionCell
    public var viewModel: HorizontalDishViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> HorizontalDishCollectionCellBuilder {
        let cell      = HorizontalDishCollectionCell.create(with: collection, with: indexPath)
        let viewModel = HorizontalDishViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = HorizontalDishCollectionCellBuilder(with: cell,
                                                              with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: HorizontalDishCollectionCell, with viewModel: HorizontalDishViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

