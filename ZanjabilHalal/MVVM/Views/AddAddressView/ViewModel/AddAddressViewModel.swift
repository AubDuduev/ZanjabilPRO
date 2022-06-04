//
//  AddAddressViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import Foundation
import Resolver

final class AddAddressViewModel: MVVMViewModelProtocol {
    
    public var model: AddAddressModel? {
        didSet { self.stateAddAddressModel() }
    }
    // MARK: - DI
    @Injected
    private var mainRouter: MainRouter
    //MARK: - implementation protocol
    public var mainView: AddAddressView?
    public var isUpdate: ClosureEmpty?
    //MARK: - Main state view model
    private func stateAddAddressModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                let addAddress: ClosureEmpty = {
                    self.mainRouter.presentNavigation(id: .inputAddressVC(nil, .saveAddress), animated: true)
                }
                let viewProperties = AddAddressView.ViewProperties(addAddress: addAddress)
                self.mainView?.update(with: viewProperties)
        }
    }
    
    init(with mainView: AddAddressView) {
        self.mainView = mainView
    }
}
