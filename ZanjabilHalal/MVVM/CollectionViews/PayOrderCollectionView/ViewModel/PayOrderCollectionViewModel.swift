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
    private var cancelable: Set<AnyCancellable> = []
    //DI
    @Injected
    private var addressesService     : AddressesService
    @Injected
    private var createAddressService : CreateAddressService
    //MARK: - Main state view model
    private func statePayOrderModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
				let payOrderCollectionCells: [PayOrderCollectionCells] = [
					.map,
					.inputOfAddress(nil),
					.payInfoCost,
					.payInfoDelivery,
					.totalPrice
				]
                let viewProperties  = PayOrderCollectionView.ViewProperties(payOrderCollectionCells: payOrderCollectionCells)
                self.mainView?.update(with: viewProperties)
			case .updateViewProperties(let defaultAddress):
				if let defaultAddress = defaultAddress {
					self.createAddressService.saveAddress(with: defaultAddress)
				}
				let payOrderCollectionCells: [PayOrderCollectionCells] = [
					.map,
					.inputOfAddress(defaultAddress),
					.payInfoCost,
					.payInfoDelivery,
					.totalPrice
				]
				self.mainView?.viewProperties?.payOrderCollectionCells = payOrderCollectionCells
				self.reloadProperties()
            case .getAddress:
                self.addressesService.subscribeDefaultAddress
					.removeDuplicates()
					.sink { defaultAddress in
                    self.model = .updateViewProperties(defaultAddress)
                }
                .store(in: &cancelable)
        }
    }
    
    init(with mainView: PayOrderCollectionView) {
        self.mainView = mainView
    }
}
