//
//  UIKit+ThemeColor.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import SwiftTheme

extension UIView {
    
    @IBInspectable var themeBackgroundColor: String? {
        set {
            guard let strValue = newValue else { return }
            theme_backgroundColor = ThemeColorPicker(stringLiteral: strValue)
        }
        get {
            return "\(String(describing: theme_backgroundColor))"
        }
    }
    
    @IBInspectable var themeTintColor: String? {
        set {
            guard let strValue = newValue else { return }
            theme_tintColor = ThemeColorPicker(stringLiteral: strValue)
        }
        get {
            return "\(String(describing: theme_tintColor))"
        }
    }
    
}

extension UILabel {
    
    @IBInspectable var themeTextColor: String? {
        set {
            guard let strValue = newValue else { return }
            theme_textColor = ThemeColorPicker(stringLiteral: strValue)
        }
        get {
            return "\(String(describing: theme_textColor))"
        }
    }
    
}
