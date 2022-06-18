//
//  YandexMapViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Foundation

final class YandexMapViewModel: MVVMViewModelProtocol {
    
    public var model: YandexMapModel? {
        didSet { self.stateYandexMapModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: YandexMapView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateYandexMapModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                print("")
            case .updateViewProperties:
                print("")
        }
    }
    
    init(with mainView: YandexMapView) {
        self.mainView = mainView
    }
}
