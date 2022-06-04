//
//  Extension + UIColor.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

extension UIColor {
    
    static func set(_ named: NameColor) -> UIColor {
        if let setColor = UIColor(named: named.rawValue) {
            return setColor
        } else {
            return .brown
        }
    }
    
    enum NameColor: String {
        case some
        case blur
        case greenOne
        case greenTwo
        case greenThree
        case greenFore
        case greenFive
        case shadowTabBar
        case shadowBuyView
    }
}
//Set Hex Collor
extension UIColor {
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}

extension UIColor {
    
    static func hexSet(hex: String) -> UIColor {
        
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        if hexString.count != 6 {
            return .black
        }
        var rgb : UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        return UIColor(red  : CGFloat((rgb & 0xFF0000) >> 16) / 255,
                       green: CGFloat((rgb & 0x00FF00) >> 8) / 255,
                       blue : CGFloat(rgb & 0x0000FF)  / 255,
                       alpha: 1)
    }
}
