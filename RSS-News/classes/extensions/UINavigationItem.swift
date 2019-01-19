//
//  UINavigationItem.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

extension UINavigationItem {
    
    var backBarButtonTitle: String? {
        get {
            return nil
        }
        set {
            backBarButtonItem = UIBarButtonItem(title: newValue, style: .plain, target: nil, action: nil)
        }
    }
    
}
