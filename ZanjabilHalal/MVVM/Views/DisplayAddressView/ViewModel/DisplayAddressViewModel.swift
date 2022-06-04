//
//  DisplayAddressViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.06.2022.
//
import Foundation

final class DisplayAddressViewModel: MVVMViewModelProtocol {
    
    public var model: DisplayAddressModel? {
        didSet { self.stateDisplayAddressModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: DisplayAddressView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateDisplayAddressModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                print("")
            case .updateViewProperties:
                print("")
        }
    }
    
    init(with mainView: DisplayAddressView) {
        self.mainView = mainView
    }
}
