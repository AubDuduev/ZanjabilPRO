//
//  MainTabBarViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 12.03.2022.
//
import UIKit
import Resolver
import SnapKit
import Combine

final class MainTabBarViewModel: MVVMViewModelProtocol {
    
    public var model: MainTabBarModel? {
        didSet { self.stateModel() }
    }
    // MARK: - DI
    //DI
    @Injected
    private var menuService         : MenuService
    @Injected
    private var mainRouter          : MainRouter
    @Injected
    private var mainCreateController: MainCreateController
    @Injected
    private var mainTabBarRouter    : MainTabBarRouter
    @Injected
    private var mainViewsBuilder    : MainViewsBuilder
    //MARK: - implementation protocol
    public var mainView   : MainTabBarViewController?
    public var isUpdate   : ClosureEmpty?
    public var tabBarView : TabBarView!
    // MARK: - Private
    private var tabBarViewModel : TabBarViewModel!
    private var cancellable     : Set<AnyCancellable> = []
    private var startLoadingView: StartLoadingView!
    
    private func stateModel(){
        guard let model = self.model else { return }
        
        switch model {
            case .createViewProperties:
                let viewDidLayoutSubviews: ClosureEmpty = {
                    self.tabBarConstraints()
                    self.appleTabBar()
                }
                let viewDidAppear: ClosureEmpty = {
                    self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: true, animatedHidden: true, tintColor: .set(.greenFore))
                }
                let viewWillAppear: ClosureEmpty = {
                    self.mainRouter.setupMainNavigationVC(isNavigationBarHidden: true, animatedHidden: true, tintColor: .set(.greenFore))
                }
               
                let viewProperties = MainTabBarViewController.ViewProperties(viewDidLayoutSubviews: viewDidLayoutSubviews,
                                                                             viewWillAppear       : viewWillAppear,
                                                                             viewDidAppear        : viewDidAppear)
                self.mainView?.update(with: viewProperties)
            case .setupTabBarView:
                self.setupTabBarView()
            case .addStartLoadingView:
                self.addStartLoadingView()
                self.menuService.subscribeUpdateMenu
                    .sink { listMenu in
                        guard !listMenu.isEmpty else { return }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.startLoadingView.removeFromSuperview()
                        }
                    }
                    .store(in: &self.cancellable)
        }
    }
    
    private func addStartLoadingView(){
        guard let view = self.mainView?.view else { return }
        let startLoadingViewBuilderViewBuilder = self.mainViewsBuilder.createStartLoadingViewBuilder()
        self.startLoadingView = startLoadingViewBuilderViewBuilder.view
        startLoadingViewBuilderViewBuilder.viewModel.model = .createViewProperties
        view.addSubview(startLoadingView)
        startLoadingView.snp.makeConstraints { startLoadingView in
            startLoadingView.edges.equalToSuperview()
        }
    }
    
    private func setupTabBarView(){
        //1
        let tabBarViewBuilder = self.mainViewsBuilder.createTabBarViewBuilder()
        self.tabBarViewModel  = tabBarViewBuilder.viewModel
        self.tabBarView       = tabBarViewBuilder.view
        self.tabBarViewModel.model = .createViewProperties
        //2
        self.setControllers()
        self.appleTabBar()
        //3
        self.addedTabBarView()
        //4
        self.tabBarViewButton()
    }
    
    private func appleTabBar(){
        self.mainView?.tabBar.backgroundColor = .clear
    }
    
    private func addedTabBarView(){
        self.mainView?.tabBar.addSubview(self.tabBarView)
    }
    
    private func tabBarViewButton(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.tabBarView.actionButton(button: UIButton())
        }
    }
   
    private func tabBarConstraints(){
        guard let mainView = self.mainView else { return }
        guard self.tabBarView.isDescendant(of: mainView.tabBar) else { return }
        mainView.tabBar.bounds.size.height = 90
        self.tabBarView.snp.makeConstraints { tabBarView in
            tabBarView.top.equalTo(10)
            tabBarView.bottom.equalTo(-20)
            tabBarView.leading.equalTo(10)
            tabBarView.trailing.equalTo(-10)
        }
        self.tabBarView.cornerRadius(10, false)
        self.tabBarView.shadowColor(color: .set(.shadowTabBar), radius: 10, sizeW: 0, sizeH: 3)
        self.tabBarViewModel.model = .setup(mainView.view.safeAreaInsets.bottom)
    }
    
    //MARK: - Create View Controllers For TabBar
    private func createVcForTabBar() -> [UIViewController] {
        let menuVC      = mainCreateController.createVC(id: .menuVC)
        let basketVC    = mainCreateController.createVC(id: .basketVC)
        let profileVC   = mainCreateController.createVC(id: .profileVC)
        let controllers = [menuVC, basketVC, profileVC]
        return controllers
    }
    
    private func setControllers(){
        self.mainView?.setViewControllers(self.createVcForTabBar(), animated: true)
    }
    
    init(with mainView: MainTabBarViewController) {
        self.mainView = mainView
    }
}
