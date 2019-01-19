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
    case white = "theme.white"
    case dark = "theme.dark"
    case paper = "theme.paper"
    
    func plistName() -> String {
        switch self {
        case .white:
            return "White"
        case .dark:
            return "Dark"
        case .paper:
            return "Paper"
        }
    }
}

struct AppSkin {
    
    private struct Constants {
        static let defaultTheme: AppTheme = .white
    }
    
    static func applyAppearance() {
        UINavigationBar.appearance().theme_tintColor = "Global.NavigationBarBackButtonColor"
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
        ThemeManager.setTheme(plistName: theme.plistName(), path: .mainBundle)
    }
    
    static var currentThemeName: String {
        let userTheme = PreferenceService.shared.theme
        let theme = AppTheme.init(rawValue: userTheme).map { $0.rawValue } ?? Constants.defaultTheme.rawValue
        return theme.localized
    }
    
}
