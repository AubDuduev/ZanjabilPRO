//
//  KeyBoardProtocol.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.04.2022.
//
import UIKit

protocol KeyBoardProtocol where Self: UIViewController {
    
    func showKeyboard(with heightAnimation: CGFloat)
    
    
    func dismissKeyboard(with heightAnimation: CGFloat)
}

extension KeyBoardProtocol {
    
    //MARK: - Подписка на уведомления появления клавиатуры
    public func setupNotification(){
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil)
        {(notification) in
            self.animationContentKeyboard(notification: notification, show: true)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil)
        {(notification) in
            self.animationContentKeyboard(notification: notification, show: false)
        }
    }
    
    //MARK: - Анимация элементов которые привязаны к появлению клавиатуры
    private func animationContentKeyboard(notification: Notification, show: Bool){
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let heightAnimation = (keyboardFrame.height - self.view.safeAreaInsets.bottom)
        UIView.animate(withDuration: 0.5) {
            switch show {
                case true:
                    self.showKeyboard(with: heightAnimation)
                case false:
                    self.dismissKeyboard(with: heightAnimation)
            }
        }
    }
}

