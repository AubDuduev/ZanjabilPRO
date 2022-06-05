//
//  AddressSuggestionTableCellBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import UIKit

final class AddressSuggestionTableCellBuilder: BuilderViewProtocol {
	
	public var view     : AddressSuggestionTableCell
	public var viewModel: AddressSuggestionTableCellViewModel
	
	public static func create(with collection: UICollectionView, with indexPath: IndexPath) -> AddressSuggestionTableCellBuilder {
		let cell      = AddressSuggestionTableCell.create()
		let viewModel = AddressSuggestionTableCellViewModel(with: cell)
		viewModel.bindMainView(with: cell)
		let selfBuilder = AddressSuggestionTableCellBuilder(with: cell,
																   with: viewModel)
		return selfBuilder
	}
	
	private init(with cell: AddressSuggestionTableCell, with viewModel: AddressSuggestionTableCellViewModel) {
		self.view      = cell
		self.viewModel = viewModel
	}
}

