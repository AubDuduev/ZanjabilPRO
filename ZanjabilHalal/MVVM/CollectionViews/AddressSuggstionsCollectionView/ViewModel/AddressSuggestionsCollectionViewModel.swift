//
//  AddressSuggestionsCollectionViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 29.05.2022.
//
import Combine
import Resolver
import UIKit

final class AddressSuggestionsCollectionViewModel: MVVMViewModelProtocol {
    
    public var model: AddressSuggestionsCollectionModel? {
        didSet { self.stateModel() }
    }
	//DI
	@Injected
	private var mainCellsBuilder: MainCollectionCellsBuilder
	@Injected
	private var daDataService: DaDataService
	// MARK: - Private
	private var cancelable: Set<AnyCancellable> = []
    //MARK: - implementation protocol
    public var mainView: AddressSuggestionsCollectionView?
   
    //MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let decAddressSuggestions):
				let collectionCells = decAddressSuggestions.count
				let viewProperties = AddressSuggestionsCollectionView.ViewProperties(collectionCells: collectionCells,
																					 decAddressSuggestions: decAddressSuggestions)
				self.mainView?.update(with: viewProperties)
			case .getSuggestionsAddressList:
				self.daDataService.suggestionsAddressesList
					.sink { [weak self] addressSuggestions in
					guard let self = self else { return }
					self.model = .createViewProperties(addressSuggestions)
				}
				.store(in: &self.cancelable)
        }
    }
    
    init(with mainView: AddressSuggestionsCollectionView) {
        self.mainView = mainView
    }
}
