//
//  TabBarItem.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarItemProtocol {
    
    var view: ViewType { get }
    var button: UIControl { get }
    
}

class HomeTabBarItem: TabBarItemProtocol {
    
    let view: ViewType
    let button: UIControl
    
    init(view: ViewType, button: UIControl) {
        self.view = view
        self.button = button
    }
    
}
