//
//  GDSetupFirebase.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 07.03.2022.
//
import Foundation
import UserNotifications
import FirebaseMessaging
import FirebaseAuth
import FirebaseAnalytics
import FirebaseFirestore
import FirebaseRemoteConfig
import Firebase

final class SetupFirebase: NSObject {
    
    public func setup(){
        FirebaseApp.configure()
    }
}
private func remoteConfig() -> RemoteConfig {
    let remoteConfig = RemoteConfig.remoteConfig()
    let settings     = RemoteConfigSettings()
    settings.minimumFetchInterval = 0
    remoteConfig.configSettings = settings
    return remoteConfig
}
public func getGeo(){
//    self.remoteConfig().fetchAndActivate { (status, error) in
//        if status != .error {
//            print(self.remoteConfig()["geo"].boolValue, " - remote configuration geo")
//            gvStoreProject.saveBool(key: .isPurchaces, value: self.remoteConfig()["geo"].boolValue)
//        }
//    }
}
