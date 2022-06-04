//
//  PayOrderViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import UIKit
import Resolver

final class PayOrderViewModel: MVVMViewModelProtocol {
    
    public var model: PayOrderModel? {
        didSet { self.statePayOrderModel() }
    }
    
    //MARK: - View controller
    public var mainView: PayOrderViewController?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Managers
    private lazy var managers     = PayOrderManagers(with: self)
    private var payOrderCollection: PayOrderCollection!
    private var listMenu          : [DECMenu] = []
    // MARK: - Private
    private var payOrderCollectionViewModel: PayOrderCollectionViewModel!
    private var actionButtonViewModel      : ActionButtonViewModel!
    
    private func statePayOrderModel(){
        guard let model = self.model else { return }
        
        switch model {
            // MARK: - Configurator
            case .createViewProperties:
                let addPayOrderCollectionView: Closure<UIView> = { container in
                    self.payOrderCollectionViewModel = self.managers.configurator.createPayOrderCollectionViewModel(with: container)
                }
                let addActionButton: Closure<UIView> = { container in
                    self.actionButtonViewModel = self.managers.configurator.createActionButtonViewModel(with: container)
                }
    
                let viewProperties = PayOrderViewController.ViewProperties(addPayOrderCollectionView: addPayOrderCollectionView,
                                                                           addActionButton          : addActionButton)
                self.updateMainView(with: viewProperties)
        }
    }
    
    init(with mainView: PayOrderViewController) {
        self.mainView = mainView
    }
}
