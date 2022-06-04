//
//  UIViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit

extension UIViewController {

    func pushVCForID(storyboardID: UIStoryboard.ID, vcID: IDVC, animation: Bool = true, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle:  UIModalPresentationStyle = .formSheet ){
        let storyboard     = UIStoryboard.create(sbID: storyboardID)
        let viewController = storyboard.instantiateViewController(withIdentifier: vcID.rawValue)
        viewController.modalTransitionStyle   = transitionStyle
        viewController.modalPresentationStyle = presentationStyle
        present(viewController, animated: animation)
    }
    func getVCForID(storyboardID: UIStoryboard.ID, vcID: IDVC, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle:  UIModalPresentationStyle = .formSheet) -> UIViewController {
        let storyboard     = UIStoryboard.create(sbID: storyboardID)
        let viewController = storyboard.instantiateViewController(withIdentifier: vcID.rawValue)
        viewController.modalTransitionStyle   = transitionStyle
        viewController.modalPresentationStyle = presentationStyle
        return viewController
    }
    func getVC(storyboardID: UIStoryboard.ID? = nil, idStoryBoard: Int? = nil, animation: Bool = true, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle:  UIModalPresentationStyle = .formSheet ) -> UIViewController{
        var storyBoard = UIStoryboard()
        if let id = idStoryBoard {
            let IDStoryBoard = UIStoryboard.ID.allCases[id].rawValue
            storyBoard = UIStoryboard(name: IDStoryBoard, bundle: nil)
        } else if let storyboardID = storyboardID {
            storyBoard = UIStoryboard(name: storyboardID.rawValue, bundle: nil)
        }
        let viewController = storyBoard.instantiateInitialViewController() ?? UIViewController()
        viewController.modalTransitionStyle   = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        return viewController
    }
    func pushVC(storyboardID: UIStoryboard.ID? = nil, idStoryBoard: Int? = nil, animation: Bool = true, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle:  UIModalPresentationStyle = .formSheet ){
        var storyBoard = UIStoryboard()
        if let id = idStoryBoard {
            let IDStoryBoard = UIStoryboard.ID.allCases[id].rawValue
            storyBoard = UIStoryboard(name: IDStoryBoard, bundle: nil)
        } else if let storyboardID = storyboardID {
            storyBoard = UIStoryboard(name: storyboardID.rawValue, bundle: nil)
        }
        let viewController = storyBoard.instantiateInitialViewController() ?? UIViewController()
        viewController.modalTransitionStyle   = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        self.present(viewController, animated: animation)
    }
    
    func present(with viewController: UIViewController, with animation: Bool, with transitionStyle: UIModalTransitionStyle, with presentationStyle:  UIModalPresentationStyle){
        viewController.modalTransitionStyle   = transitionStyle
        viewController.modalPresentationStyle = presentationStyle
        self.present(viewController, animated: animation)
    }
    
    enum IDVC: String {
        
        case MainVC = "MainViewController"
    }
}

