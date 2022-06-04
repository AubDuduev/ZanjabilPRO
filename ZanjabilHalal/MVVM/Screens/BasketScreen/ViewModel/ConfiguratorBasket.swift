//
//  ConfiguratorBasket.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import Resolver
import UIKit

final class ConfiguratorBasket {
    
    //MARK: - Public variable
    private unowned let VM: BasketViewModel
    @Injected
    private var mainViewsBuilder: MainViewsBuilder
    @Injected
    private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    
    public func createBasketCollectionViewBuilder(with containerView: UIView) -> BasketCollectionViewModel {
        let basketCollectionViewBuilder = self.mainCollectionViewsBuilder.createBasketCollectionViewBuilder()
        let basketCollectionView        = basketCollectionViewBuilder.view
        containerView.addSubview(basketCollectionView)
        basketCollectionView.snp.makeConstraints { basketCollectionView in
            basketCollectionView.edges.equalToSuperview()
        }
        return basketCollectionViewBuilder.viewModel
    }
    
    public func createBasketTotalSumViewModel(with containerView: UIView) -> BasketTotalSumViewModel {
        let basketTotalSumViewBuilder = self.mainViewsBuilder.createBasketTotalSumViewBuilder()
        let basketTotalSumView        = basketTotalSumViewBuilder.view
        containerView.addSubview(basketTotalSumView)
        basketTotalSumView.snp.makeConstraints { basketTotalSumView in
            basketTotalSumView.edges.equalToSuperview()
        }
        return basketTotalSumViewBuilder.viewModel
    }
    
    public func addedBuyView(with container: UIView){
        let didTapBuy: ClosureEmpty = { [weak self] in
            self?.VM.model = .pushPayOrderVC
        }
        let viewProperties = BuyView.ViewProperties(didTapBuy: didTapBuy)
        let buyView = self.mainViewsBuilder.createView(with: .buyView, with: viewProperties) as! BuyView
        buyView.update(with: viewProperties)
        container.addSubview(buyView)
        container.cornerRadius(32, false)
        container.shadowColor(color: .set(.shadowBuyView), radius: 8, sizeW: 0, sizeH: 0)
        buyView.snp.makeConstraints { buyView in
            buyView.edges.equalToSuperview()
        }
    }
    
    //MARK: - Inition
    init(with viewModel: BasketViewModel) {
        self.VM = viewModel
    }
}
