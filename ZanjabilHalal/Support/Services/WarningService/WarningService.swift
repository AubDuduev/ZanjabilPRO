//
//
//  WarningService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
//
import Resolver
import UIKit

private typealias R = TextResources.WarningService.Names

final class WarningService: ServiceProtocol {
    
    @Injected
    private var mainViewsBuilder: MainViewsBuilder
    private var warningView     : WarningView!
    
    private var loaderWindow: UIWindow = {
        $0.rootViewController = UIViewController()
        $0.windowLevel = .normal + 1
        $0.makeKeyAndVisible()
        $0.isHidden = true
        return $0
    }(UIWindow(windowScene: UIApplication.shared.windows.first!.windowScene!))
    
    public var update: ClosureAny?
    
    public func present(with warningTextType: WarningTextType, dismiss: Bool) {
        self.loaderWindow.isHidden = false
        self.warningView = mainViewsBuilder.createWarningViewBuilder(with: warningTextType).view
        self.warningView.frame = CGRect(x: 8,
                                        y: 32,
                                        width : self.loaderWindow.bounds.width - 16,
                                        height: 50)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self = self else { return }
            self.warningView.transform = CGAffineTransform(translationX: 0, y: -100)
            UIView.animate(withDuration: 0.5) {
                self.loaderWindow.rootViewController?.view.backgroundColor = .set(.blur)
            }
            self.loaderWindow.rootViewController?.view.addSubview(self.warningView)
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5) {
                    self.warningView.transform = .identity
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                guard let self = self else { return }
                UIView.animate(withDuration: 0.5) {
                    self.loaderWindow.rootViewController?.view.backgroundColor = .clear
                }
            }
        }
        guard dismiss else { return }
        self.dismiss()
    }
    
    public func dismiss(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.5) {
                self.warningView.transform = CGAffineTransform(translationX: 0, y: -100)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.loaderWindow.isHidden = true
        }
    }
}

enum WarningTextType: String {
    
    case build
    case city
    case apartment
    case floor
    case intercom
    case street
    
    public func text() -> String {
        switch self {
            case .build:
                return R.build.localizedString()
            case .city:
                return R.city.localizedString()
            case .apartment:
                return R.apartment.localizedString()
            case .floor:
                return R.floor.localizedString()
            case .intercom:
                return R.intercom.localizedString()
            case .street:
                return R.street.localizedString()
        }
    }
}
