//
//  AppSkin.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import SwiftTheme

enum AppTheme: String {
    case white = "White"
    case dark = "Dark"
    case paper = "Paper"
}

struct AppSkin {
    
    static func applyAppearance() {
        
    }
    
    static func setTheme(_ theme: AppTheme) {
        ThemeManager.setTheme(plistName: theme.rawValue, path: .mainBundle)
    }
    
}
