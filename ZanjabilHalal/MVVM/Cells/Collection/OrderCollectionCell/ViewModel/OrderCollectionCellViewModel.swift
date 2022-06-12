//
//  OrderCollectionCellViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import Foundation

final class OrderCollectionCellViewModel: MVVMViewModelProtocol {
    
    public var model: OrderCollectionCellModel? {
        didSet { self.stateOrderModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: OrderCollectionCell?
    public var isUpdate: ClosureEmpty?
    
    //MARK: - Main state view model
    private func stateOrderModel(){
        guard let model = self.model else { return }
        switch model {
            // MARK: - 
            case .createViewProperties(let orderDish):
                let viewProperties = OrderCollectionCell.ViewProperties(orderDish: orderDish)
                self.mainView?.update(with: viewProperties)
        }
    }
    
    init(with mainView: OrderCollectionCell) {
        self.mainView = mainView
    }
}
