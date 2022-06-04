//
//  MainTabBarRouter.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import Resolver
import UIKit

final class MainTabBarRouter {
    
    @Injected
    private var mainCreateController: MainCreateController
    
    lazy private var tabBarViewController: MainTabBarViewController = mainCreateController.tabBarViewController
    
    private var currentPresentationVC: UIViewController?
    
    //MARK: - Create View Controllers For TabBar
    private func createVcForTabBar() -> [UIViewController] {
        let menuVC      = self.mainCreateController.createVC(id: .menuVC)
        let basketVC    = self.mainCreateController.createVC(id: .basketVC)
        let profileVC   = self.mainCreateController.createVC(id: .profileVC)
        let controllers = [menuVC, basketVC, profileVC]
        return controllers
    }
    
    public func switchTabBarVC(with index: Int) {
        self.tabBarViewController.selectedIndex = index
        self.currentPresentationVC = self.tabBarViewController.viewControllers?[index]
    }
    
    public func setControllers(){
        self.tabBarViewController.setViewControllers(self.createVcForTabBar(), animated: true)
    }
}
