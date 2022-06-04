//
//  PayInfoViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Foundation

final class PayInfoViewModel: MVVMViewModelProtocol {
    
    public var model: PayInfoModel? {
        didSet { self.statePayInfoModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: PayInfoView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func statePayInfoModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let payInfoCellTypes):
                let viewProperties = PayInfoView.ViewProperties(payInfoCellTypes: payInfoCellTypes)
                self.updateMainView(with: viewProperties)
            case .updateViewProperties:
                print("")
        }
    }
    
    init(with mainView: PayInfoView) {
        self.mainView = mainView
    }
}
