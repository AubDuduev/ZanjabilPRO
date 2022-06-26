//
//  PayOrderCollectionViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import UIKit
import Combine

final class PayOrderCollectionViewModel: MVVMViewModelProtocol {
    
    public var model: PayOrderCollectionModel? {
        didSet { self.statePayOrderModel() }
    }
    //MARK: - implementation protocol
    public var mainView: PayOrderCollectionView?
    public var isUpdate: ClosureEmpty?
    // MARK: - Private
    private var cancelable   : Set<AnyCancellable> = []
    private var addresses    : [DECAddress]!
    //DI
    @Injected
    private var addressesService     : AddressesService
    @Injected
    private var createAddressService : CreateAddressService
    //MARK: - Main state view model
    private func statePayOrderModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let defaultAddress):
                if let defaultAddress = defaultAddress {
                    self.createAddressService.setAddress(with: defaultAddress)
                }
				let payOrderCollectionCells: [PayOrderCollectionCells] = [
					.map,
					.inputOfAddress(defaultAddress),
					.payInfoCost,
					.payInfoDelivery,
					.totalPrice
				]
                let viewProperties  = PayOrderCollectionView.ViewProperties(payOrderCollectionCells: payOrderCollectionCells)
                self.mainView?.update(with: viewProperties)
            case .getAddress:
                self.addressesService.subscribeUpdate.sink { addresses in
                    self.addresses     = addresses
                    let defaultAddress = addresses.first(where: { $0.isDefault })
                    self.model = .createViewProperties(defaultAddress)
                }
                .store(in: &cancelable)
                self.addressesService.getAddresses()
        }
    }
    
    init(with mainView: PayOrderCollectionView) {
        self.mainView = mainView
    }
}
