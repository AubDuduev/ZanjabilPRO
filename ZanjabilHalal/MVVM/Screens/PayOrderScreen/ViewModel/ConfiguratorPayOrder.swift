//
//  ConfiguratorPayOrder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import Resolver
import UIKit

final class ConfiguratorPayOrder {
    
    //MARK: - Public variable
    private unowned let VM: PayOrderViewModel
    //DI
    @Injected
    private var mainViewsBuilder          : MainViewsBuilder
    @Injected
    private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    
    public func createPayOrderCollectionViewModel(with containerView: UIView) -> PayOrderCollectionViewModel {
        let payOrderCollectionViewBuilder     = self.mainCollectionViewsBuilder.createPayOrderCollectionViewBuilder()
        let payOrderCollectionViewBuilderView = payOrderCollectionViewBuilder.view
        payOrderCollectionViewBuilder.viewModel.model = .getAddress
        containerView.addSubview(payOrderCollectionViewBuilderView)
        payOrderCollectionViewBuilderView.snp.makeConstraints { payOrderCollectionViewBuilderView in
            payOrderCollectionViewBuilderView.edges.equalToSuperview()
        }
        return payOrderCollectionViewBuilder.viewModel
    }

    public func createActionButtonViewModel(with containerView: UIView) -> ActionButtonViewModel {
        let actionButtonViewBuilder = self.mainViewsBuilder.createActionButtonViewBuilder()
        let actionButtonView        = actionButtonViewBuilder.view
        actionButtonViewBuilder.viewModel.model = .createViewProperties(.payOrder)
        containerView.addSubview(actionButtonView)
        actionButtonView.snp.makeConstraints { actionButtonView in
            actionButtonView.top.equalTo(containerView)
            actionButtonView.left.equalTo(containerView)
            actionButtonView.right.equalTo(containerView)
            actionButtonView.height.equalTo(48)
        }
        return actionButtonViewBuilder.viewModel
    }
    
    //MARK: - Inition
    init(with viewModel: PayOrderViewModel) {
        self.VM = viewModel
    }
}
