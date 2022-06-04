//
//  LoadingService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 21.04.2022.
//
import NVActivityIndicatorView
import Resolver
import UIKit

private typealias R = TextResources.InfoAlertService.Names

final class LoadingService: ServiceProtocol {
    
    // MARK: - DI
    @Injected
    private var mainViewsBuilder: MainViewsBuilder
    
    private var loadingAnimationView: NVActivityIndicatorView!
    private let loadingView         = UIView()
    
    private var loaderWindow: UIWindow = {
        $0.rootViewController = UIViewController()
        $0.windowLevel = .normal + 1
        $0.makeKeyAndVisible()
        $0.isHidden = true
        return $0
    }(UIWindow(windowScene: UIApplication.shared.windows.first!.windowScene!))
    
    public func present(with loadingType: LoadingType, dismiss: Bool) {
        self.loaderWindow.isHidden = false
        //
        self.addedLoadingView()
        //
        self.setupLoadingAnimationView(padding: 0, color: .set(.greenFore), type: .ballTrianglePath)
        //
        self.isAnimationLocal(show: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self = self else { return }
            UIView.animate(withDuration: 0.5) {
                self.loaderWindow.rootViewController?.view.backgroundColor = .set(.blur)
            }
        }
        guard dismiss else { return }
        self.dismiss()
    }
    
    public func setupLoadingAnimationView(padding: CGFloat = 0, color: UIColor = .clear, type: NVActivityIndicatorType = .circleStrokeSpin){
        self.loadingAnimationView = NVActivityIndicatorView(frame  : loadingView.frame,
                                                            type   : type,
                                                            color  : color,
                                                            padding: 0)
        self.loadingView.addSubview(self.loadingAnimationView)
        self.loadingAnimationView.snp.makeConstraints { loadingAnimationView in
            loadingAnimationView.edges.equalToSuperview()
        }
    }
    
    public func addedLoadingView(){
        let mainView = self.loaderWindow.rootViewController!.view!
        mainView.addSubview(self.loadingView)
        self.loadingView.snp.makeConstraints { loaderWindow in
            loaderWindow.center.equalTo(mainView)
            loaderWindow.height.equalTo(100)
            loaderWindow.width.equalTo(100)
        }
    }
    
    public func isAnimationLocal(show: Bool){
        guard let loadingAnimationView = self.loadingAnimationView else { return }
        if show {
            loadingAnimationView.startAnimating()
        } else {
            loadingAnimationView.stopAnimating()
        }
    }
    
    public func dismiss(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.5) {
                self.loaderWindow.rootViewController?.view.backgroundColor = .clear
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.loaderWindow.isHidden = true
        }
        self.isAnimationLocal(show: false)
    }
    
}

enum LoadingType: String {
    
    case simple
}
