//
//  AppThemeService.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import SwiftTheme

protocol AppThemeServiceProtocol {
    var currentTheme: AppTheme { get }
    var defaultTheme: AppTheme { get }
    
    func setupTheme()
    func setTheme(_ theme: AppTheme)
}

class AppThemeService: AppThemeServiceProtocol {
    
    private struct Constants {
        static let defaultTheme: AppTheme = .white
    }
    
    private var preferenceService: AppPreferenceServiceProtocol
    
    init(_ preferenceService: AppPreferenceServiceProtocol) {
        self.preferenceService = preferenceService
    }
    
    func setupTheme() {
        let userTheme = preferenceService.theme
        if let appTheme = AppTheme.init(rawValue: userTheme) {
            setTheme(appTheme)
        } else {
            setTheme(Constants.defaultTheme)
        }
    }
    
    func setTheme(_ theme: AppTheme) {
        preferenceService.theme = theme.rawValue
        ThemeManager.setTheme(plistName: theme.plistName(), path: .mainBundle)
    }
    
    var currentTheme: AppTheme {
        let userTheme = preferenceService.theme
        let theme = AppTheme.init(rawValue: userTheme) ?? Constants.defaultTheme
        return theme
    }
    
    var defaultTheme: AppTheme {
        return Constants.defaultTheme
    }
    
}
