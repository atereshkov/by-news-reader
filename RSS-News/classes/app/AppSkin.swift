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
    
    private struct Constants {
        static let defaultTheme: AppTheme = .white
    }
    
    static func applyAppearance() {
        
    }
    
    static func setup() {
        let userTheme = PreferenceService.shared.theme
        if let appTheme = AppTheme.init(rawValue: userTheme) {
            setTheme(appTheme)
        } else {
            setTheme(Constants.defaultTheme)
        }
    }
    
    static func setTheme(_ theme: AppTheme) {
        ThemeManager.setTheme(plistName: theme.rawValue, path: .mainBundle)
    }
    
}
