//
//  ChangeAddressViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 04.06.2022.
//
import Resolver
import UIKit
import Combine
import CoreLocation

final class ChangeAddressViewModel: MVVMViewModelProtocol {
    
    public var model: ChangeAddressModel? {
        didSet { self.stateChangeAddressModel() }
    }
	// MARK: - DI
	@Injected
	private var mainViewsBuilder              : MainViewsBuilder
	@Injected
	private var yandexMapCameraListenerService: YandexMapCameraListenerService
	@Injected
	private var mainRouter                    : MainRouter
	@Injected
	private var mainCollectionViewsBuilder    : MainCollectionViewsBuilder
    //MARK: - implementation protocol
    public var mainView: ChangeAddressView?
    public var isUpdate: ClosureEmpty?
	// MARK: - Private
	private var cancellable                 : Set<AnyCancellable> = []
	private var addressesCollectionViewModel: AddressesCollectionViewModel!
	private var actionButtonViewModel       : ActionButtonViewModel!
    //MARK: - Main state view model
    private func stateChangeAddressModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
				let didTapSearchAddress: ClosureEmpty = {
					self.model = .didTapSearchAddress
				}
				let addAddressCollectionView: Closure<UIView> = { container in
					self.model = .addAddressCollectionView(container)
				}
				let addActionButton: Closure<UIView> = { container in
					self.actionButtonViewModel = self.createActionButtonViewModel(with: container)
				}
				let viewProperties = ChangeAddressView.ViewProperties(currentAddress          : nil,
																	  didTapSearchAddress     : didTapSearchAddress,
																	  addAddressCollectionView: addAddressCollectionView,
																	  addActionButton         : addActionButton)
				self.mainView?.create(with: viewProperties)
			case .setupYandexMapCameraListenerService:
				// MARK: - изменения геопозиции пользователя
				self.yandexMapCameraListenerService.completionAddress
					.sink(receiveValue: { yandexGEOObject in
						self.model = .updateAddress(yandexGEOObject)
						//self.geoPositioningService.saveAddressSuggestion(with: suggestionsAddress)
					})
					.store(in: &self.cancellable)
			case .addAddressCollectionView(let containerView):
				self.addressesCollectionViewModel       = self.createAddressCollectionViewViewModel(with: containerView)
				self.addressesCollectionViewModel.model = .createViewProperties(addressCollectionType: .display)
			case .updateAddress(let yandexGEOObject):
				let currentAddress = yandexGEOObject.fullStreet
				self.mainView?.viewProperties?.currentAddress = currentAddress
				self.reloadProperties()
			case .didTapSearchAddress:
				self.mainRouter.presentNavigation(id: .addressSuggestionScreenVC, animated: true)
        }
    }
	
	public func createAddressCollectionViewViewModel(with containerView: UIView) -> AddressesCollectionViewModel {
		let addressCollectionViewBuilder = self.mainCollectionViewsBuilder.createAddressesCollectionViewBuilder()
		let addressCollectionView        = addressCollectionViewBuilder.view
		containerView.addSubview(addressCollectionView)
		addressCollectionView.snp.makeConstraints { addressCollectionView in
			addressCollectionView.edges.equalToSuperview()
		}
		return addressCollectionViewBuilder.viewModel
	}
	
	public func createActionButtonViewModel(with containerView: UIView) -> ActionButtonViewModel {
		let actionButtonViewBuilder = self.mainViewsBuilder.createActionButtonViewBuilder()
		let actionButtonView        = actionButtonViewBuilder.view
		actionButtonViewBuilder.viewModel.model = .createViewProperties(.addAddress)
		containerView.addSubview(actionButtonView)
		actionButtonView.snp.makeConstraints { actionButtonView in
			actionButtonView.top.equalTo(containerView)
			actionButtonView.left.equalTo(containerView)
			actionButtonView.right.equalTo(containerView)
			actionButtonView.height.equalTo(48)
		}
		return actionButtonViewBuilder.viewModel
	}

    init(with mainView: ChangeAddressView) {
        self.mainView = mainView
    }
}
