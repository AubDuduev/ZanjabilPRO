//
//  AddressSuggestionCollectionCellViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import Foundation

final class AddressSuggestionCollectionCellViewModel: MVVMViewModelProtocol {
    
    public var model: AddressSuggestionCollectionCellModel? {
        didSet { self.stateAddressSuggestionModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: AddressSuggestionCollectionCell?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateAddressSuggestionModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let addressSuggestion):
				let viewProperties = AddressSuggestionCollectionCell.ViewProperties(addressSuggestion: addressSuggestion)
				self.mainView?.update(with: viewProperties)
        }
    }
    
    init(with mainView: AddressSuggestionCollectionCell) {
        self.mainView = mainView
    }
}
