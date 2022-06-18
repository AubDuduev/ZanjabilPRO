//
//  AddressesViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit
import Resolver

final class AddressesViewModel: MVVMViewModelProtocol {
    
    public var model: AddressesModel? {
        didSet { self.stateModel() }
    }
    //DI
    @Injected
    private var mainViewsBuilder          : MainViewsBuilder
    @Injected
    private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    // MARK: - Private
    private var addressesCollectionViewModel: AddressesCollectionViewModel!
    private var addAddressViewModel         : AddAddressViewModel!
    //MARK: - implementation protocol
    public var mainView: AddressesViewController?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                let addressesCollectionView: Closure<UIView> = { containerView in
                    self.model = .addressesCollectionView(containerView)
                }
                let addAddressButtonView: Closure<UIView> = { containerView in
                    self.model = .addAddressButtonView(containerView)
                }
                let viewProperties = AddressesViewController.ViewProperties(addressesCollectionView: addressesCollectionView,
                                                                            addAddressButtonView   : addAddressButtonView)
                self.mainView?.update(with: viewProperties)
            case .addressesCollectionView(let containerView):
                self.addressesCollectionViewModel       = self.createAddressCollectionViewViewModel(with: containerView)
                self.addressesCollectionViewModel.model = .createViewProperties(addressCollectionType: .edit)
            case .addAddressButtonView(let containerView):
                self.addAddressViewModel       = self.createAddAddressViewModel(with: containerView)
                self.addAddressViewModel.model = .createViewProperties
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
    
    public func createAddAddressViewModel(with containerView: UIView) -> AddAddressViewModel {
        let addAddressViewBuilder = self.mainViewsBuilder.createAddAddressViewBuilder()
        let addAddressView        = addAddressViewBuilder.view
        containerView.addSubview(addAddressView)
        containerView.cornerRadius(32, false)
        containerView.shadowColor(color: .set(.shadowBuyView), radius: 8, sizeW: 0, sizeH: 0)
        addAddressView.snp.makeConstraints { addAddressView in
            addAddressView.edges.equalToSuperview()
        }
        return addAddressViewBuilder.viewModel
    }
    
    init(with mainView: AddressesViewController) {
        self.mainView = mainView
    }
}
