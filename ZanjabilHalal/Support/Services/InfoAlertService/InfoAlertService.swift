//
//
//  InfoAlertService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
//
import Resolver
import UIKit

private typealias R = TextResources.InfoAlertService.Names

final class InfoAlertService: ServiceProtocol {
   
    // MARK: - DI
    @Injected
    private var mainViewsBuilder: MainViewsBuilder
    private var infoAlertView   : InfoAlertView!
    
    private var loaderWindow: UIWindow = {
        $0.rootViewController = UIViewController()
        $0.windowLevel = .normal + 1
        $0.makeKeyAndVisible()
        $0.isHidden = true
        return $0
    }(UIWindow(windowScene: UIApplication.shared.windows.first!.windowScene!))
    
    public func present(with infoAlertDescriptionType: InfoAlertDescriptionType, dismiss: Bool) {
        self.loaderWindow.isHidden = false
        self.infoAlertView = mainViewsBuilder.createInfoAlertViewBuilder(with: infoAlertDescriptionType).view
        let mainScreenHeight = UIScreen.main.bounds.height + 50
        let mainScreenWidth  = UIScreen.main.bounds.width
        self.infoAlertView.frame = CGRect(x     : 0,
                                          y     : mainScreenHeight,
                                          width : mainScreenWidth,
                                          height: 400)
        self.infoAlertView.cornerRadius(radius: 16, direction: .top, clipsToBounds: false)
        self.infoAlertView.shadowColor(color: .set(.shadowBuyView), radius: 6, sizeW: 0, sizeH: 0)
        self.loaderWindow.rootViewController?.view.addSubview(self.infoAlertView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self = self else { return }
            UIView.animate(withDuration: 0.5) {
                self.loaderWindow.rootViewController?.view.backgroundColor = .set(.blur)
                self.infoAlertView.transform = CGAffineTransform(translationX: 0, y: -450)
            }
        }
        guard dismiss else { return }
        self.dismiss()
    }
    
    public func dismiss(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.5) {
                self.infoAlertView.transform = .identity
                self.loaderWindow.rootViewController?.view.backgroundColor = .clear
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.loaderWindow.isHidden = true
        }
    }
    
}

enum InfoAlertDescriptionType: String {
    
    case paySuccess
    
    public func text() -> String {
        switch self {
            case .paySuccess:
                return R.paySuccess.localizedString()
        }
    }
}
