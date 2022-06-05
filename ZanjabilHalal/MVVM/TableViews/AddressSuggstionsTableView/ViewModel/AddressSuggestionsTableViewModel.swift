//
//  AddressSuggestionsTableViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import Combine
import Resolver
import UIKit

final class AddressSuggestionsTableViewModel: MVVMViewModelProtocol {
    
    public var model: AddressSuggestionsTableModel? {
        didSet { self.stateModel() }
    }
    //MARK: - implementation protocol
    public var mainView: AddressSuggestionsTableView?
    //DI
    @Injected
    private var mainCellsBuilder: MainCollectionCellsBuilder
	@Injected
	private var daDataService   : DaDataService
	@Injected
	private var mainRouter      : MainRouter
	// MARK: - Private
	private var cancelable: Set<AnyCancellable> = []
    //MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
			case .createViewProperties(let decAddressSuggestions):
				let didSelectRowAt: Closure<IndexPath> = { indexPath in
					self.mainRouter.dissmiss(animated: true)
				}
				let countCells     = decAddressSuggestions.count
				let viewProperties = AddressSuggestionsTableView.ViewProperties(didSelectRowAt       : didSelectRowAt,
																				countCells           : countCells,
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
    
    init(with mainView: AddressSuggestionsTableView) {
        self.mainView = mainView
    }
}
