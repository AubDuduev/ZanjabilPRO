//
//  AddressSuggestionTableCellViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import Foundation

final class AddressSuggestionTableCellViewModel: MVVMViewModelProtocol {
	
	public var model: AddressSuggestionTableCellModel? {
		didSet { self.stateAddressSuggestionModel() }
	}
	
	//MARK: - implementation protocol
	public var mainView: AddressSuggestionTableCell?
	
	//MARK: - Main state view model
	private func stateAddressSuggestionModel(){
		guard let model = self.model else { return }
		switch model {
			case .createViewProperties(let addressSuggestion):
				let viewProperties = AddressSuggestionTableCell.ViewProperties(addressSuggestion: addressSuggestion)
				self.mainView?.update(with: viewProperties)
		}
	}
	
	init(with mainView: AddressSuggestionTableCell) {
		self.mainView = mainView
	}
}
