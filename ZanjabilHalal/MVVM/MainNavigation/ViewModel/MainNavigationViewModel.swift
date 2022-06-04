//
//  MainNavigationViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit
import Resolver

final class MainNavigationViewModel: MVVMViewModelProtocol {
    
    public var model: MainNavigationModel? {
        didSet { self.stateModel() }
    }
    // MARK: - DI
    @Injected
    private var mainRouter: MainRouter
    // MARK: - View
    public var mainView: MainNavigationViewController?
    public var isUpdate: ClosureEmpty?
    
    private func stateModel(){
        guard let model = self.model else { return }
        
    }

    init(with mainView: MainNavigationViewController) {
        self.mainView = mainView
    }
}
