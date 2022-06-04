//
//  LottieService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit
import Lottie
import SnapKit

final class LottieService {
    
    private var view          : UIView!
    private var animationView : AnimationView!
    
    public func setup(lottieName: LottieName, view: UIView){
        self.view = view
        let animation       = Animation.named(lottieName.rawValue)
        self.animationView  = AnimationView(animation: animation)
        animationView.contentMode = .scaleAspectFit
        animationView.animation   = animation
        animationView.loopMode    = .playOnce
        animationView.animationSpeed = 1
        view.insertSubview(animationView, at: 0)
        self.animationView.snp.makeConstraints { animationView in
            animationView.left.equalTo(view)
            animationView.right.equalTo(view)
            animationView.width.equalTo(view)
            animationView.center.equalTo(view)
        }
    }
    public func play(){
        animationView.play()
        
    }
    
    public func stop(){
        self.animationView.currentProgress = 0
    }
    
    enum LottieName: String {
        case zanjabilLogo
    }
}
