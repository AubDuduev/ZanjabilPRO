//
//  InternetСheckService.swift
//  Network
//
//  Created by Senior Developer on 12.03.2022.
//
import Foundation
import UIKit
import Reachability

final class InternetСheckService {
    
    public func check() -> Bool {
        let reachability = try? Reachability()
        switch reachability?.connection {
            case .cellular:
                print("cellular")
                return true
            case .wifi:
                print("wifi")
                return true
            case .unavailable:
                AlertService.shared.default(title: .error, message: .noNetwork)
                return false
            default:
                AlertService.shared.default(title: .error, message: .noNetwork)
                return false
        }
    }
    static func check() -> Bool {
        let reachability = try? Reachability()
        switch reachability?.connection {
            case .cellular:
                print("cellular")
                return true
            case .wifi:
                print("wifi")
                return true
            case .unavailable:
                AlertService.shared.default(title: .error, message: .noNetwork)
                return false
            default:
                AlertService.shared.default(title: .error, message: .noNetwork)
                return false
        }
    }
}


