//
//  Extension + UIFont.swift
//  DG.BET
//
//  Created by -=ALEKSANDR=- on 22/August/2019.
//  Copyright © 2019 -=ALEKSANDR=-. All rights reserved.
//
import UIKit

extension UIFont {
    
    static func set(_ name: UIFont.FontName, _ size: CGFloat) -> UIFont{
        if let font = UIFont(name: name.rawValue, size: size){
            return font
        }
        return UIFont.systemFont(ofSize: size)
    }
    enum FontName: String {
        case rubikRegular = "Rubik-Regular"
        case rubikItalic  = "Rubik-Italic"
        case rubikLight   = "Rubik-Light"
        case rubikMedium  = "Rubik-Medium"
    }
}

