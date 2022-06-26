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
	//DI
	@Injected
	private var mainViewsBuilder          : MainViewsBuilder
	@Injected
	private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    //MARK: - View controller
    public var mainView: PayOrderViewController?
    public var isUpdate: ClosureEmpty?
    // MARK: - Private
    private var payOrderCollectionViewModel: PayOrderCollectionViewModel!
    private var actionButtonViewModel      : ActionButtonViewModel!
	private var payOrderCollection         : PayOrderCollection!
	private var listMenu                   : [DECMenu] = []
    
    private func statePayOrderModel(){
        guard let model = self.model else { return }
        
        switch model {
            // MARK: - Configurator
            case .createViewProperties:
                let addPayOrderCollectionView: Closure<UIView> = { container in
                    self.payOrderCollectionViewModel = self.createPayOrderCollectionViewModel(with: container)
                }
                let addActionButton: Closure<UIView> = { container in
                    self.actionButtonViewModel = self.createActionButtonViewModel(with: container)
                }
    
                let viewProperties = PayOrderViewController.ViewProperties(addPayOrderCollectionView: addPayOrderCollectionView,
                                                                           addActionButton          : addActionButton)
                self.updateMainView(with: viewProperties)
        }
    }
	
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
    
    init(with mainView: PayOrderViewController) {
        self.mainView = mainView
    }
}
