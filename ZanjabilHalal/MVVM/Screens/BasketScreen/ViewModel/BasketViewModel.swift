//
//  BasketViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import UIKit
import Resolver
import AnimatedGradientView

final class BasketViewModel: MVVMViewModelProtocol {
    
    public var model: BasketModel? {
        didSet { self.stateBasketModel() }
    }
    // MARK: - DI
    @Injected
    private var menuService       : MenuService
    @Injected
    private var localBasketService: LocalBasketService
    @Injected
    private var mainRouter        : MainRouter
    //MARK: - implementation protocol
    public var mainView: BasketViewController?
    public var isUpdate: ClosureEmpty?
    //MARK: - Managers
    private lazy var managers = BasketManagers(with: self)
    // MARK: - Private
    private var basketCollectionViewModel: BasketCollectionViewModel!
    private var basketTotalSumViewModel  : BasketTotalSumViewModel!
    
    private func stateBasketModel(){
        guard let model = self.model else { return }
        
        switch model {
            case .createViewProperties:
                let addedBasketCollectionView: Closure<UIView> = { containerView in
                    self.model = .addedBasketCollectionView(containerView)
                }
                let addBlurHeaderView: Closure<UIView> = { containerView in
                    self.model = .addBlurHeaderView(containerView)
                }
                let addBuyView: Closure<UIView> = { containerView in
                    self.model = .addBuyView(containerView)
                }
                let addBasketTotalSumView: Closure<UIView> = { containerView in
                    self.model = .addBasketTotalSumView(containerView)
                }
                let viewDidLoad: ClosureEmpty = {
                    
                }
                let createViewProperties = BasketViewController.ViewProperties(addedBasketCollectionView: addedBasketCollectionView,
                                                                               addBuyView               : addBuyView,
                                                                               addBasketTotalSumView    : addBasketTotalSumView,
                                                                               addBlurHeaderView        : addBlurHeaderView,
                                                                               viewDidLoad              : viewDidLoad)
                self.mainView?.update(with: createViewProperties)
            case .addedBasketCollectionView(let containerView):
                self.basketCollectionViewModel = self.managers.configurator.createBasketCollectionViewBuilder(with: containerView)
            case .addBlurHeaderView(let containerView):
                self.addBlurHeaderView(with: containerView)
            case .addBuyView(let containerBuyView):
                self.managers.configurator.addedBuyView(with: containerBuyView)
            case .addBasketTotalSumView(let containerView):
                self.basketTotalSumViewModel = self.managers.configurator.createBasketTotalSumViewModel(with: containerView)
                self.basketTotalSumViewModel.model = .getMenu
            // MARK: - Router
            case .pushPayOrderVC:
                self.mainRouter.pushMainNavigation(id: .payOrderVC, animated: true)
                self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: false, animatedHidden: true, tintColor: .set(.greenFore))
        }
    }
    
    public func addBlurHeaderView(with containerView: UIView){
        let width = UIScreen.main.bounds.width
        let frame = CGRect(x: 0, y: 0, width: width, height: 8)
        let animatedGradient = AnimatedGradientView(frame: frame)
        animatedGradient.direction = .up
        animatedGradient.colors = [[#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]]
        containerView.addSubview(animatedGradient)
    }
    
    init(with mainView: BasketViewController) {
        self.mainView = mainView
    }
}
