//
//  OrderCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import UIKit

final class OrderCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : OrderCollectionCell
    public var viewModel: OrderCollectionCellViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> OrderCollectionCellBuilder {
        let cell      = OrderCollectionCell.create(with: collection, with: indexPath)
        let viewModel = OrderCollectionCellViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = OrderCollectionCellBuilder(with: cell,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: OrderCollectionCell, with viewModel: OrderCollectionCellViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

