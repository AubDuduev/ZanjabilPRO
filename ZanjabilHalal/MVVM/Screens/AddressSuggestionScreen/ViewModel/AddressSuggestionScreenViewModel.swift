//
//  AddressSuggestionScreenViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 31.05.2022.
//
import Resolver
import UIKit

final class AddressSuggestionScreenViewModel: MVVMViewModelProtocol {
    
    public var model: AddressSuggestionScreenModel? {
        didSet { self.stateModel() }
    }
	// MARK: - DI
	@Injected
	private var mapService           : MapKitService
	@Injected
	private var mainViewsBuilder     : MainViewsBuilder
	@Injected
	private var mainTableViewsBuilder: MainTableViewsBuilder
    //MARK: - implementation protocol
    public var mainView: AddressSuggestionScreenViewController?
    public var isUpdate: ClosureEmpty?
	// MARK: - Private
	private var searchAddressViewModel          : SearchAddressViewModel!
	private var addressSuggestionsTableViewModel: AddressSuggestionsTableViewModel!
	//MARK: - Main state view model
	private func stateModel(){
		guard let model = self.model else { return }
		switch model {
			case .createViewProperties:
				let addAddressSuggestionsListView : Closure<UIView> = { container in
					self.model = .addAddressSuggestionsListView(container)
				}
				let addSearchAddressView : Closure<UIView> = { container in
					self.model = .addSearchAddressView(container)
				}
				let viewProperties = AddressSuggestionScreenViewController.ViewProperties(addAddressSuggestionsListView: addAddressSuggestionsListView,
																						  addSearchAddressView         : addSearchAddressView)
				self.mainView?.create(with: viewProperties)
			case .addAddressSuggestionsListView(let container):
				self.addressSuggestionsTableViewModel       = self.createAddressSuggestionsTableViewViewModel(with: container)
				self.addressSuggestionsTableViewModel.model = .getSuggestionsAddressList
			case .addSearchAddressView(let container):
				self.searchAddressViewModel = self.createSearchAddressViewModel(with: container)
		}
	}
	
	public func createSearchAddressViewModel(with containerView: UIView) -> SearchAddressViewModel {
		let searchAddressViewBuilder = self.mainViewsBuilder.createSearchAddressViewBuilder()
		let searchAddressView        = searchAddressViewBuilder.view
		containerView.addSubview(searchAddressView)
		searchAddressView.snp.makeConstraints { searchAddressView in
			searchAddressView.edges.equalToSuperview()
		}
		return searchAddressViewBuilder.viewModel
	}
	
	public func createAddressSuggestionsTableViewViewModel(with containerView: UIView) -> AddressSuggestionsTableViewModel {
		let addressSuggestionsTableViewBuilder = self.mainTableViewsBuilder.createAddressSuggestionsTableViewBuilder()
		let addressSuggestionsTableView        = addressSuggestionsTableViewBuilder.view
		containerView.addSubview(addressSuggestionsTableView)
		addressSuggestionsTableView.snp.makeConstraints { addressSuggestionsTableView in
			addressSuggestionsTableView.edges.equalToSuperview()
		}
		return addressSuggestionsTableViewBuilder.viewModel
	}
    
    init(with mainView: AddressSuggestionScreenViewController) {
        self.mainView = mainView
    }
}
