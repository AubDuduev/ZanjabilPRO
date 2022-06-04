//
//  Extension + UIImageView.swift
//  Inters
//
//  Created by DEVELOPER on 19/03/2020.
//  Copyright © 2020 DEVELOPER. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func set(nameImage: NameImage){
        self.image = UIImage(named: nameImage.rawValue)
    }
    
    func setSystem(_ nameImage: NameImage){
        self.image = UIImage(systemName: nameImage.rawValue)
    }
    
    enum NameImage: String {
        
        case horizontalMenu = "rectangle.split.2x1"
        case verticalMenu   = "rectangle.split.1x2"
        case checkmark      = "checkmark.square.fill"
        case square         = "square.fill"
    }
}


