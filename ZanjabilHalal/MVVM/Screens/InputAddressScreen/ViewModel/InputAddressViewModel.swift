//
//  InputAddressViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import UIKit

final class InputAddressViewModel: MVVMViewModelProtocol {
    
    public var model: InputAddressModel? {
        didSet { self.logicInputAddressModel() }
    }
    //DI
    @Injected
    private var mainViewsBuilder          : MainViewsBuilder
    @Injected
    private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    //MARK: - Private
    private var inputAddressCollectionViewModel: InputAddressCollectionViewModel!
    private var actionButtonViewModel          : ActionButtonViewModel!
    private var address                        : DECAddress!
    //MARK: - implementation protocol
    public var mainView: InputAddressViewController?
    public var isUpdate: ClosureEmpty?
    
    private func logicInputAddressModel(){
        guard let model = self.model else { return }
        
        switch model {
            case .createViewProperties(let address, let actionButtonType):
                self.address = address
                let addedInputAddressCollectionView: Closure<UIView> = { container in
                    self.model = .createInputAddressCollectionViewModel(container)
                }
                let addActionButton: Closure<UIView> = { container in
                    self.actionButtonViewModel       = self.createActionButtonViewModel(with: container)
                    self.actionButtonViewModel.model = .createViewProperties(actionButtonType)
                }
                let viewProperties = InputAddressViewController.ViewProperties(addedInputAddressCollectionView: addedInputAddressCollectionView,
                                                                               address                        : self.address,
                                                                               addActionButton                : addActionButton)
                self.mainView?.update(with: viewProperties)
            case .createInputAddressCollectionViewModel(let container):
                self.inputAddressCollectionViewModel       = self.createInputAddressCollectionViewModel(with: container)
                self.inputAddressCollectionViewModel.model = .createViewProperties(self.address, true)
        }
    }
    
    public func createInputAddressCollectionViewModel(with containerView: UIView) -> InputAddressCollectionViewModel {
        let createInputAddressCollectionViewBuilder = self.mainCollectionViewsBuilder.createInputAddressCollectionViewBuilder()
        let createInputAddressCollectionView        = createInputAddressCollectionViewBuilder.view
        containerView.addSubview(createInputAddressCollectionView)
        createInputAddressCollectionView.snp.makeConstraints { createInputAddressCollectionView in
            createInputAddressCollectionView.edges.equalToSuperview()
        }
        return createInputAddressCollectionViewBuilder.viewModel
    }
    
    public func createActionButtonViewModel(with containerView: UIView) -> ActionButtonViewModel {
        let actionButtonViewBuilder = self.mainViewsBuilder.createActionButtonViewBuilder()
        let actionButtonView        = actionButtonViewBuilder.view
        containerView.addSubview(actionButtonView)
        actionButtonView.snp.makeConstraints { actionButtonView in
            actionButtonView.top.equalTo(containerView)
            actionButtonView.left.equalTo(containerView)
            actionButtonView.right.equalTo(containerView)
            actionButtonView.height.equalTo(48)
        }
        return actionButtonViewBuilder.viewModel
    }
    
    init(with mainView: InputAddressViewController) {
        self.mainView = mainView
    }
}
