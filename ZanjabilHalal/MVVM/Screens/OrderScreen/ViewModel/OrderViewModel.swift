//
//  OrderViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Foundation

final class OrderViewModel: MVVMViewModelProtocol {
    
    public var modelOrder: OrderModel? {
        didSet { self.logicOrderModel() }
    }
    //MARK: - implementation protocol
    public var mainView: OrderViewController?
    public var isUpdate: ClosureEmpty?
  
    
    private func logicOrderModel(){
        guard let model = self.modelOrder else { return }
        
    }
    
    init(with mainView: OrderViewController) {
        self.mainView = mainView
    }
}
