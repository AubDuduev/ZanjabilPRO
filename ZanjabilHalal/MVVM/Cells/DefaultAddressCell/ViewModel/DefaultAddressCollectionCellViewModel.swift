//
//  DefaultAddressCollectionCellViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import Foundation
import Resolver

final class DefaultAddressCollectionCellViewModel: MVVMViewModelProtocol {
    
    public var model: DefaultAddressCollectionCellModel? {
        didSet { self.stateDefaultAddressModel() }
    }
    // MARK: - DI
    @Injected
    private var createAddressService: CreateAddressService
    // MARK: - implementation protocol
    public var mainView: DefaultAddressCollectionCell?
    public var isUpdate: ClosureEmpty?
    // MARK: - Main state view model
    private func stateDefaultAddressModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let isDefault):
                let didAction: ClosureEmpty = {
                    self.mainView?.viewProperties?.isDefault.toggle()
                    self.mainView?.update(with: self.mainView?.viewProperties)
                }
                let viewProperties = DefaultAddressCollectionCell.ViewProperties(didAction: didAction,
                                                                                 isDefault: isDefault)
                self.mainView?.update(with: viewProperties)
        }
    }
    
    init(with mainView: DefaultAddressCollectionCell) {
        self.mainView = mainView
    }
}
