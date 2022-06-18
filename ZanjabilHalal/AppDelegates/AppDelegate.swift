//
//  AppDelegate.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Resolver
import UIKit
import CoreData
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let mainRouter       = MainRouter()
    private let setupFirebase    = SetupFirebase()
	private let yandexMapService = YandexMapService()
	private let arcGISService    = ArcGISService()
	
    
    public var window: UIWindow?
    
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // MARK: - setupFirebase
        self.setupFirebase.setup()
		// MARK: - setup yandexMapService
		self.yandexMapService.activate()
		// MARK: - ArcGISService
		self.arcGISService.setup()
        //set root viewController
        self.mainRouter.setRootViewController(id: .loadingVC)
        return true
    }
}

