//
//  MainRouter.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Resolver
import UIKit

private typealias R = TextResources.Navigation

// MARK: - It is responsible for creating navigation in App
final class MainRouter {
    
    // MARK: - DI
    @Injected
    private var mainViewControllersBuilder: MainViewControllersBuilder
    @Injected
    private var mainCreateController      : MainCreateController
    // MARK: - VC
    private var newNavigationVC      : UINavigationController!
    private var currentPresentationVC: UIViewController!
    // MARK: - Lazy
    lazy private var navigationViewController: MainNavigationViewController = mainCreateController.navigationViewController
    
    // MARK: - Логика переключения в навигационном контроллере
    public func pushMainNavigation(id mainNavigationControllersID: MainCreateController.ControllersID, animated: Bool = false){
        self.currentPresentationVC = self.mainCreateController.createVC(id: mainNavigationControllersID)
        self.navigationViewController.pushViewController(self.currentPresentationVC, animated: animated)
    }
    // MARK: - Logic presentation in NavigationViewController
    public func presentNavigation(id mainNavigationControllersID: MainCreateController.ControllersID, animated: Bool = false){
        self.currentPresentationVC = self.mainCreateController.createVC(id: mainNavigationControllersID)
        self.navigationViewController.present(self.currentPresentationVC, animated: animated)
    }
    // MARK: - New navigation stack
    public func createNewNavigationVC(id rootVcID: MainCreateController.ControllersID, animated: Bool = false){
        self.currentPresentationVC = self.mainCreateController.createVC(id: rootVcID)
        self.newNavigationVC       = UINavigationController(rootViewController: self.currentPresentationVC)
    }
    
    public func pushRootInCurrentNavigationVC(id rootVcID: MainCreateController.ControllersID, animated: Bool){
        self.currentPresentationVC = self.mainCreateController.createVC(id: rootVcID)
        self.newNavigationVC.pushViewController(self.currentPresentationVC, animated: animated)
    }
    
    public func popRootInCurrentNavigationVC(id rootVcID: MainCreateController.ControllersID, animated: Bool){
        self.newNavigationVC.popViewController(animated: animated)
    }
    
    public func setRootViewController(id rootVcID: MainCreateController.ControllersID){
        let window: UIWindow?? = UIApplication.shared.delegate?.window
        //создаем основной контроллер creating main viewController
        let rootViewController = self.mainCreateController.createVC(id: rootVcID)
        //создаем рутовый контроллер
        window??.rootViewController = rootViewController
        window??.makeKeyAndVisible()
    }
    
//    public func setupNewNavigationVC(isNavigationBarHidden: Bool = false, animatedHidden: Bool = false, tintColor: UIColor = .blue, backButtonTitle: String = "", title: TextResources.Router.NavigationTitle = .empty){
//        self.newNavigationVC.navigationBar.tintColor       = tintColor
//        self.newNavigationVC.navigationBar.backItem?.title = backButtonTitle
//        self.newNavigationVC.title                         = title.localizedString()
//        self.newNavigationVC.setNavigationBarHidden(isNavigationBarHidden, animated: animatedHidden)
//    }
    
	public func setupMainNavigationVC(isNavigationBarHidden: Bool = false, animatedHidden: Bool = false, tintColor: UIColor = .blue, backButtonTitle: TextResources.Navigation.NavigationButtonTitle = .back, title: TextResources.Navigation.NavigationTitle = .empty) {
        self.navigationViewController.navigationBar.tintColor        = tintColor
        self.navigationViewController.navigationBar.backItem?.title  = backButtonTitle.localizedString()
        self.navigationViewController.navigationBar.isTranslucent    = true
        self.navigationViewController.title                          = title.localizedString()
        self.navigationViewController.navigationItem.backButtonTitle = backButtonTitle.localizedString()
        self.navigationViewController.navigationBar.shadowImage      = UIImage()
        self.navigationViewController.setNavigationBarHidden(isNavigationBarHidden, animated: animatedHidden)
    }
    
    // MARK: - Логика отображения в контроле другой контроллер
    public func present(presentingID: MainCreateController.ControllersID, presentID: MainCreateController.ControllersID, animation: Bool = false, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle: UIModalPresentationStyle = .fullScreen){
        let presentingController = self.mainCreateController.createVC(id: presentingID)
        let presentController    = self.mainCreateController.createVC(id: presentID)
        presentingController.present(with: presentController,
                                     with: animation,
                                     with: transitionStyle,
                                     with: presentationStyle)
    }
}
