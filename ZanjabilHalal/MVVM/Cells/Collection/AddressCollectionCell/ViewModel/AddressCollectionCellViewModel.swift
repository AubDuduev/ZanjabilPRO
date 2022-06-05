//
//  AddressCollectionCellViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit
import Resolver

final class AddressCollectionCellViewModel: MVVMViewModelProtocol {
    
    public var model: AddressCollectionCellModel? {
        didSet { self.stateAddressModel() }
    }
    // MARK: - DI
    @Injected
    private var mainRouter      : MainRouter
    @Injected
    private var addressesService: AddressesService
    //MARK: - implementation protocol
    public var mainView: AddressCollectionCell?
    public var isUpdate: ClosureEmpty?
    //MARK: - Main state view model
    private func stateAddressModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let address, let addressCollectionType):
                let didTapEditAddress  : Closure<DECAddress> = { address in
                    self.mainRouter.presentNavigation(id: .inputAddressVC(address, .editAddress), animated: true)
                }
                let didTapDeleteAddress: Closure<DECAddress> = { address in
                    let address = ENCAddress(address: address, isDefault: false)
                    self.addressesService.deleteAddress(with: address) {
                        
                    }
                }
                let didTapCellAddress: Closure<DECAddress> = { address in
                    let address = ENCAddress(address: address, isDefault: true)
                    self.addressesService.changeDefaultAddress(with: address)
                }
                
				let viewProperties = AddressCollectionCell.ViewProperties(addressCollectionType: addressCollectionType,
																		  address              : address,
                                                                          didTapEditAddress    : didTapEditAddress,
                                                                          didTapDeleteAddress  : didTapDeleteAddress,
                                                                          didTapCellAddress    : didTapCellAddress)
                self.mainView?.update(with: viewProperties)
        }
    }
    
    init(with mainView: AddressCollectionCell) {
        self.mainView = mainView
    }
}
