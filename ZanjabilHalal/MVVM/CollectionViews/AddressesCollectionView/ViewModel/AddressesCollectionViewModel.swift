//
//  AddressesCollectionViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import Combine
import Resolver
import UIKit

final class AddressesCollectionViewModel: MVVMViewModelProtocol {
    
    public var model: AddressesCollectionModel? {
        didSet { self.stateAddressesModel() }
    }
    //DI
    @Injected
    private var mainCellsBuilder: MainCollectionCellsBuilder
    @Injected
    private var addressesService: AddressesService
    // MARK: - Private
    private var cancelable: Set<AnyCancellable> = []
    //MARK: - implementation protocol
    public var mainView: AddressesCollectionView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateAddressesModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let addressCollectionType):
                self.addressesService.subscribeUpdate.sink { addresses in
					let viewProperties = AddressesCollectionView.ViewProperties(addressCollectionType: addressCollectionType,
																				addresses: addresses)
                    self.mainView?.update(with: viewProperties)
                }
                .store(in: &cancelable)
                self.addressesService.getAddresses()
        }
    }
    
    init(with mainView: AddressesCollectionView) {
        self.mainView = mainView
    }
}
