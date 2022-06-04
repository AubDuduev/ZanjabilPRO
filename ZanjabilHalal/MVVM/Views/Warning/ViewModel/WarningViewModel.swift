//
//  WarningViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Foundation

final class WarningViewModel: MVVMViewModelProtocol {
    
    public var model: WarningModel? {
        didSet { self.logicWarningModel() }
    }
    
    //MARK: - View
    public weak var mainView: WarningView?
    public var isUpdate: ClosureEmpty?
    
    private func logicWarningModel(){
        guard let model = self.model else { return }
        
        switch model {
            case .createViewProperties(let warningText):
                let viewProperties = WarningView.ViewProperties(text: warningText.text)
                self.mainView?.update(with: viewProperties)
            case .updateViewProperties:
                print("")
        }
    }
   
    init(with mainView: WarningView) {
        self.mainView = mainView
    }
}
