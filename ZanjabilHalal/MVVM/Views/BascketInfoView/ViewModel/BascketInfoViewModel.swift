//
//  BascketInfoViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import Foundation

final class BascketInfoViewModel: MVVMViewModelProtocol {
    
    public var model: BascketInfoModel? {
        didSet { self.stateBascketInfoModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: BascketInfoView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateBascketInfoModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                print("")
            case .updateViewProperties:
                print("")
        }
    }
    
    init(with mainView: BascketInfoView) {
        self.mainView = mainView
    }
}
