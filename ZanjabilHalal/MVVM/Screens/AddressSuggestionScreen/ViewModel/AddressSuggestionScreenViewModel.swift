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
	public var viewProperties: AddressSuggestionScreenViewController.ViewProperties?
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
			case .addAddressSuggestionsListView(let container):
				self.addressSuggestionsCollectionViewModel = self.createAddressSuggestionsCollectionViewViewModel(with: container)
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
		//self.mainView?.view.insertSubview(addressSuggestionsCollectionView, at: 1000)
		addressSuggestionsCollectionView.translatesAutoresizingMaskIntoConstraints = false
		addressSuggestionsCollectionView.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
		addressSuggestionsCollectionView.leadingAnchor.constraint(equalTo: self.mainView!.view.leadingAnchor).isActive = true
		addressSuggestionsCollectionView.trailingAnchor.constraint(equalTo: self.mainView!.view.trailingAnchor).isActive = true
		addressSuggestionsCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
		return addressSuggestionsCollectionViewBuilder.viewModel
	}
    
    init(with mainView: AddressSuggestionScreenViewController) {
        self.mainView = mainView
    }
}
