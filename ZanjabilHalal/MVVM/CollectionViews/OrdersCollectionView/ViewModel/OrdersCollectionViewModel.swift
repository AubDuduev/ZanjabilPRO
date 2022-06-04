//
//  OrdersCollectionViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import Resolver
import UIKit
import Combine

final class OrdersCollectionViewModel: MVVMViewModelProtocol {
    
    public var model: OrdersCollectionModel? {
        didSet { self.stateModel() }
    }
    //DI
    @Injected
    private var mainCellsBuilder: MainCellsBuilder
    @Injected
    private var ordersService   : OrdersService
    // MARK: - Private
    private var cancelable: Set<AnyCancellable> = []
    // MARK: - implementation protocol
    public var mainView: OrdersCollectionView?
    public var isUpdate: ClosureEmpty?
    // MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                self.ordersService.subscribeUpdate.sink { orders in
                    guard !orders.isEmpty else { return }
                    let viewProperties = OrdersCollectionView.ViewProperties(orders: orders)
                    self.mainView?.update(with: viewProperties)
                }
                .store(in: &cancelable)
                self.ordersService.getOrders()
        }
    }
    
    init(with mainView: OrdersCollectionView) {
        self.mainView = mainView
    }
}
