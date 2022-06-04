//
//  AddressSuggestionCollectionCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import UIKit

final class AddressSuggestionCollectionCellBuilder: BuilderViewProtocol {
    
    public var view     : AddressSuggestionCollectionCell
    public var viewModel: AddressSuggestionCollectionCellViewModel
    
    public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> AddressSuggestionCollectionCellBuilder {
        let cell      = AddressSuggestionCollectionCell.create(with: collection, with: indexPath)
        let viewModel = AddressSuggestionCollectionCellViewModel(with: cell)
        viewModel.bindMainView(with: cell)
        let selfBuilder = AddressSuggestionCollectionCellBuilder(with: cell,
                                                                        with: viewModel)
        return selfBuilder
    }
    
    private init(with cell: AddressSuggestionCollectionCell, with viewModel: AddressSuggestionCollectionCellViewModel) {
        self.view      = cell
        self.viewModel = viewModel
    }
}

