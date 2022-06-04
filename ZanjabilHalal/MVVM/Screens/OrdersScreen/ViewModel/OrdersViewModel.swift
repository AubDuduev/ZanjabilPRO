//
//  OrdersViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit
import Resolver

final class OrdersViewModel: MVVMViewModelProtocol {
    
    public var model: OrdersModel? {
        didSet { self.stateOrdersModel() }
    }
    //DI
    @Injected
    private var mainViewsBuilder          : MainViewsBuilder
    @Injected
    private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    // MARK: - Private
    private var ordersCollectionViewModel: OrdersCollectionViewModel!
    //MARK: - implementation protocol
    public var mainView: OrdersViewController?
    public var isUpdate: ClosureEmpty?
    //MARK: - Main state view model
    private func stateOrdersModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                let addedOrdersCollectionView: Closure<UIView> = { container in
                    self.model = .addedOrdersCollectionView(container)
                }
                let viewProperties = OrdersViewController.ViewProperties(addedOrdersCollectionView: addedOrdersCollectionView)
                self.mainView?.update(with: viewProperties)
            case .addedOrdersCollectionView(let containerView):
                self.ordersCollectionViewModel = self.createOrdersCollectionViewViewModel(with: containerView)
                self.ordersCollectionViewModel.model = .createViewProperties
        }
    }
    
    public func createOrdersCollectionViewViewModel(with containerView: UIView) -> OrdersCollectionViewModel {
        let ordersCollectionViewBuilder = self.mainCollectionViewsBuilder.createOrdersCollectionViewBuilder()
        let ordersCollectionView        = ordersCollectionViewBuilder.view
        containerView.addSubview(ordersCollectionView)
        ordersCollectionView.snp.makeConstraints { ordersCollectionView in
            ordersCollectionView.edges.equalToSuperview()
        }
        return ordersCollectionViewBuilder.viewModel
    }
    
    init(with mainView: OrdersViewController) {
        self.mainView = mainView
    }
}
