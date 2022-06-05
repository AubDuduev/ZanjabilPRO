//
//  PayOrderCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Resolver
import UIKit

final class PayOrderCollectionCellBuilder: BuilderViewProtocol {

    
    public var view     : PayOrderCollectionCell
    public var viewModel: PayOrderCollectionCellViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> PayOrderCollectionCellBuilder {
        let view      = PayOrderCollectionCell.create(with: collection, with: indexPath)
        let viewModel = PayOrderCollectionCellViewModel(with: view)
        viewModel.bindMainView(with: view)
        let selfBuilder = PayOrderCollectionCellBuilder(with: view,
                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with view: PayOrderCollectionCell, with viewModel: PayOrderCollectionCellViewModel) {
        self.view      = view
        self.viewModel = viewModel
    }
}

