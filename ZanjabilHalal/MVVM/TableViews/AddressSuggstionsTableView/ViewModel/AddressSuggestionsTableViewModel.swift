//
//  AddressSuggestionsTableViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import Combine
import Resolver
import UIKit
import CoreLocation

final class AddressSuggestionsTableViewModel: MVVMViewModelProtocol {
    
    public var model: AddressSuggestionsTableModel? {
        didSet { self.stateModel() }
    }
    //MARK: - implementation protocol
    public var mainView: AddressSuggestionsTableView?
    //DI
	@Injected
	private var geoPositioningService: GeoPositioningService
    @Injected
    private var mainCellsBuilder     : MainCollectionCellsBuilder
	@Injected
	private var daDataService        : DaDataService
	@Injected
	private var mainRouter           : MainRouter
	@Injected
	private var createAddressService : CreateAddressService
	// MARK: - Private
	private var cancelable: Set<AnyCancellable> = []
    //MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
			case .createViewProperties(let decAddressSuggestions):
				let didSelectRowAt: Closure<IndexPath> = { indexPath in
					self.mainRouter.dismiss(animated: true)
					if let addressSuggestion = self.createAddressSuggestion(with: indexPath) {
						self.model = .createAddressForSuggestion(addressSuggestion)
						self.model = .setCoordinateToMap(addressSuggestion)
					}
				}
				let countCells     = decAddressSuggestions.count
				let viewProperties = AddressSuggestionsTableView.ViewProperties(didSelectRowAt       : didSelectRowAt,
																				countCells           : countCells,
																				decAddressSuggestions: decAddressSuggestions)
				self.mainView?.update(with: viewProperties)
			case .createAddressForSuggestion(let addressSuggestion):
				self.createAddressService.createForSuggestion(with: addressSuggestion)
			case .setCoordinateToMap(let addressSuggestion):
				guard let addressSuggestionData = addressSuggestion.addressData else { return }
				let coordinate = CLLocationCoordinate2D(latitude : addressSuggestionData.latitude,
														longitude: addressSuggestionData.longitude)
				self.geoPositioningService.setCoordinate(with: coordinate)
				self.geoPositioningService.saveAddressSuggestion(with: addressSuggestion)
			case .getSuggestionsAddressList:
				self.daDataService.suggestionsAddressesList
					.sink { [weak self] addressSuggestions in
						guard let self = self else { return }
						self.model = .createViewProperties(addressSuggestions)
					}
					.store(in: &self.cancelable)
        }
    }
	
	private func createAddressSuggestion(with indexPath: IndexPath) -> DECAddressSuggestion? {
		let decAddressSuggestions = mainView?.viewProperties?.decAddressSuggestions
		let addressSuggestionData = decAddressSuggestions?[indexPath.row]
		return addressSuggestionData
	}
    
    init(with mainView: AddressSuggestionsTableView) {
        self.mainView = mainView
    }
}
