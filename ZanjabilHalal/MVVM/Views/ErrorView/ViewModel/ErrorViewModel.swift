//
//  ErrorViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import Foundation

final class ErrorViewModel: MVVMViewModelProtocol {
    
    public var model: ErrorModel? {
        didSet { self.logicErrorModel() }
    }
    
    //MARK: - View
    public weak var mainView: ErrorView?
    public var isUpdate: ClosureEmpty?
    
    private func logicErrorModel(){
        guard let model = self.model else { return }
        
    }
    
    init(with mainView: ErrorView) {
        self.mainView = mainView
    }
}
