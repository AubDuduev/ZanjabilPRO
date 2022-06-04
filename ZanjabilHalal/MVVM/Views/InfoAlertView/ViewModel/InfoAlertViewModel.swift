//
//  InfoAlertViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import Foundation

final class InfoAlertViewModel: MVVMViewModelProtocol {
    
    public var model: InfoAlertModel? {
        didSet { self.stateInfoAlertModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: InfoAlertView?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateInfoAlertModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let infoAlertDescriptionType):
                let viewProperties = InfoAlertView.ViewProperties(infoAlertDescriptionType: infoAlertDescriptionType)
                self.mainView?.update(with: viewProperties)
        }
    }
    
    init(with mainView: InfoAlertView) {
        self.mainView = mainView
    }
}
