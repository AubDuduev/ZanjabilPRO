//
//  ChangeAddressViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 04.06.2022.
//
import Resolver
import UIKit
import Combine

final class ChangeAddressViewModel: MVVMViewModelProtocol {
    
    public var model: ChangeAddressModel? {
        didSet { self.stateChangeAddressModel() }
    }
	// MARK: - DI
	@Injected
	private var mapService                : MapService
	@Injected
	private var mainRouter                : MainRouter
	@Injected
	private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    //MARK: - implementation protocol
    public var mainView: ChangeAddressView?
    public var isUpdate: ClosureEmpty?
	// MARK: - Private
	private var cancellable                 : Set<AnyCancellable> = []
	private var addressesCollectionViewModel: AddressesCollectionViewModel!
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
				let viewProperties = ChangeAddressView.ViewProperties(currentAddress          : nil,
																	  didTapSearchAddress     : didTapSearchAddress,
																	  addAddressCollectionView: addAddressCollectionView)
				self.mainView?.create(with: viewProperties)
			case .setupLocationService:
				self.mapService.setupLocationService()
				self.mapService.startUserLocation()
				self.mapService.completionAddress
					.sink(receiveValue: { address in
						//guard let self = self else { return }
						self.model = .updateAddress(address)
					})
					.store(in: &self.cancellable)
			case .addAddressCollectionView(let containerView):
				self.addressesCollectionViewModel       = self.createAddressCollectionViewViewModel(with: containerView)
				self.addressesCollectionViewModel.model = .createViewProperties
			case .updateAddress(let currentAddress):
				self.mainView?.viewProperties?.currentAddress = currentAddress
				self.reloadProperties()
			case .didTapSearchAddress:
				self.mainRouter.pushMainNavigation(id: .addressSuggestionScreenVC, animated: true)
				self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: false, animatedHidden: true, tintColor: .set(.greenFore), title: .addressList)
        }
    }
	
	public func createAddressCollectionViewViewModel(with containerView: UIView) -> AddressesCollectionViewModel {
		let addressCollectionViewBuilder = self.mainCollectionViewsBuilder.createAddressesCollectionViewBuilder()
		let addressCollectionView        = addressCollectionViewBuilder.view
		containerView.subviews.forEach({ print( $0.self)})
		containerView.subviews.forEach({ print( String(describing: $0.self))})
		if !containerView.isAdded(of: addressCollectionView) {
			containerView.addSubview(addressCollectionView)
			addressCollectionView.snp.makeConstraints { addressCollectionView in
				addressCollectionView.edges.equalToSuperview()
			}
		}
		return addressCollectionViewBuilder.viewModel
	}
	
    init(with mainView: ChangeAddressView) {
        self.mainView = mainView
    }
}
 //containerView.isDescendant(of: addressCollectionView)
