//
//  UIKit+Localization.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

extension UIButton {
    
    @IBInspectable var localizedTitle: String? {
        set {
            setTitle(newValue?.localized, for: .normal)
        }
        get {
            return currentTitle
        }
    }
    
}

extension UILabel {
    
    @IBInspectable var localizedTitle: String? {
        set {
            text = newValue?.localized
        }
        get {
            return text
        }
    }
    
}
