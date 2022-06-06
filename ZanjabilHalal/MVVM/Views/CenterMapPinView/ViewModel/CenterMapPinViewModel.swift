//
//  CenterMapPinViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.06.2022.
//
import Foundation

final class CenterMapPinViewModel: MVVMViewModelProtocol {
    
    public var model: CenterMapPinModel? {
        didSet { self.stateCenterMapPinModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: CenterMapPinView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateCenterMapPinModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                print("")
            case .updateViewProperties:
                print("")
        }
    }
    
    init(with mainView: CenterMapPinView) {
        self.mainView = mainView
    }
}
