//
//  Fonts.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

enum Fonts {
    
    case tabBarButton
    case navBarTitle
    
    case custom(name: String, size: CGFloat)
    
    var uiFont: UIFont {
        switch self {
        case .custom(let name, let size):
            return UIFont(name: name, size: size)!
        case .tabBarButton:
            return UIFont(name: "Arial", size: 9)!
        case .navBarTitle:
            return UIFont(name: "Arial", size: 17)!
        }
    }
    
}
