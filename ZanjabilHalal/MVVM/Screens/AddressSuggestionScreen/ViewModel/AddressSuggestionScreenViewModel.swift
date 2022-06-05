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
	private var mapService                : MapService
	@Injected
	private var mainViewsBuilder          : MainViewsBuilder
	@Injected
	private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    //MARK: - implementation protocol
    public var mainView: AddressSuggestionScreenViewController?
    public var isUpdate: ClosureEmpty?
	// MARK: - Private
	private var searchAddressViewModel               : SearchAddressViewModel!
	private var addressSuggestionsCollectionViewModel: AddressSuggestionsCollectionViewModel!
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
				self.addressSuggestionsCollectionViewModel       = self.createAddressSuggestionsCollectionViewViewModel(with: container)
				self.addressSuggestionsCollectionViewModel.model = .getSuggestionsAddressList
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
	
	public func createAddressSuggestionsCollectionViewViewModel(with containerView: UIView) -> AddressSuggestionsCollectionViewModel {
		let addressSuggestionsCollectionViewBuilder = self.mainCollectionViewsBuilder.createAddressSuggestionsCollectionViewBuilder()
		let addressSuggestionsCollectionView        = addressSuggestionsCollectionViewBuilder.view
		containerView.addSubview(addressSuggestionsCollectionView)
		addressSuggestionsCollectionView.snp.makeConstraints { addressSuggestionsCollectionView in
			addressSuggestionsCollectionView.edges.equalToSuperview()
		}
		return addressSuggestionsCollectionViewBuilder.viewModel
	}
    
    init(with mainView: AddressSuggestionScreenViewController) {
        self.mainView = mainView
    }
}
