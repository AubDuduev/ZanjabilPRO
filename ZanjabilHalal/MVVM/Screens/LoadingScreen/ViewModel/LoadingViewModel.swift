//
//  LoadingViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit
import Resolver

final class LoadingViewModel: MVVMViewModelProtocol {
    
    public var model: LoadingModel? {
        didSet { self.stateLoadingModel() }
    }
    // MARK: - DI
    @Injected
    private var mainRouter   : MainRouter
    @Injected
    private var lottieService: LottieService
    // MARK: - View
    public var mainView: LoadingViewController?
    public var isUpdate: ClosureEmpty?
    
    private func stateLoadingModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                let viewDidLoad  : ClosureEmpty = {
                    
                }
                let addLogo: Closure<UIView> = { containerView in
                    self.lottieService.setup(lottieName: .zanjabilLogo, view: containerView)
                    self.lottieService.play()
                }
                let viewDidAppear: ClosureEmpty = {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.model = .pushTabBarVC
                    }
                }
                let viewProperties = LoadingViewController.ViewProperties(viewDidLoad  : viewDidLoad,
                                                                          viewDidAppear: viewDidAppear,
                                                                          addLogo      : addLogo)
                self.mainView?.update(with: viewProperties)
            case .pushTabBarVC:
                self.mainRouter.setRootViewController(id: .mainNavigationVC)
                self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: true,
                                                      tintColor            : .set(.greenFore),
													  backButtonTitle      : .back)
        }
    }
    
    
    init(with mainView: LoadingViewController) {
        self.mainView = mainView
    }
}
