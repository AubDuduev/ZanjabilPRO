//
//  Extension + UIStoryboard.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit

extension UIStoryboard {
    
    static func create(sbID: UIStoryboard.ID, _ bundleID: BundleID? = nil) -> UIStoryboard {
        var bundle: Bundle?
        if let bundleID = bundleID {
            bundle = Bundle(identifier: bundleID.rawValue)
        }
        return UIStoryboard(name: sbID.rawValue, bundle: bundle)
    }
    static func createVC(sbID: UIStoryboard.ID, _ bundleID: BundleID? = nil) -> UIViewController {
        var bundle: Bundle?
        if let bundleID = bundleID {
            bundle = Bundle(identifier: bundleID.rawValue)
        }
        
        let storyBoard     = UIStoryboard(name: sbID.rawValue, bundle: bundle)
        let viewController = storyBoard.instantiateInitialViewController() ?? UIViewController()
        return viewController
    }
    
    static func createVCID(sbID: UIStoryboard.ID, vcID: UIViewController.IDVC, _ bundleID: BundleID? = nil) -> UIViewController {
        var bundle        : Bundle?
        unowned var viewController: UIViewController!
        if let bundleID = bundleID {
            bundle = Bundle(identifier: bundleID.rawValue)
        }
        let storyBoard = UIStoryboard(name: sbID.rawValue, bundle: bundle)
        viewController = storyBoard.instantiateViewController(identifier: vcID.rawValue)
        
        return viewController
    }
    enum ID: String, CaseIterable {
        
        case Main
    }
    enum BundleID: String, CaseIterable {
        
        case Some
    }
}

