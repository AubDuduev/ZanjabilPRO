//
//  InputAddressViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import Foundation

final class InputAddressCollectionViewModel: MVVMViewModelProtocol {
    
    public var model: InputAddressCollectionModel? {
        didSet { self.stateInputAddressModel() }
    }
    //MARK: - implementation protocol
    public var mainView: InputAddressCollectionView?
    public var isUpdate: ClosureEmpty?
    //MARK: - Main state view model
    private func stateInputAddressModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let address, let isPresentAddresses):
				let inputAddressTypes: [InputAddressTypes] = [.city(address?.city, isPresentAddresses),
                                                              .street(address?.street),
                                                              .build(address?.build),
                                                              .apartment(address?.apartment),
                                                              .floor(address?.floor),
                                                              .intercom(address?.intercom)]
                let collectionViewProperties = InputAddressCollectionView.ViewProperties(inputAddressTypes: inputAddressTypes,
                                                                                         address          : address)
                self.mainView?.update(with: collectionViewProperties)
        }
    }
    
    init(with mainView: InputAddressCollectionView) {
        self.mainView = mainView
    }
}

