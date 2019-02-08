//
//  PreferenceService.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

private enum PreferenceKeys: String {
    case initApp = "rss-news.InitializeKeyPreference"
    case theme = "rss-news.Theme"
    case provider = "rss-news.Provider"
    
    case onboardingPassed = "rss-news.OnboardingPassed"
}

protocol AppPreferenceServiceProtocol {
    var theme: String { get set }
    var provider: String { get set }
    var initialSetupPassed: Bool { get set }
}

class AppPreferenceService: AppPreferenceServiceProtocol {
    
    private let userDefaults: UserDefaults
    
    // MARK: Init
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        
        initialize()
    }
    
    private func initialize() {
        if isFirstRunApp() {
            clear()
            initializeApp()
        }
    }
    
    // MARK: Properties
    
    var theme: String {
        get {
            return userDefaults.string(forKey: PreferenceKeys.theme.rawValue) ?? ""
        }
        set {
            userDefaults.set(newValue, forKey: PreferenceKeys.theme.rawValue)
        }
    }
    
    var provider: String {
        get {
            return userDefaults.string(forKey: PreferenceKeys.provider.rawValue) ?? ""
        }
        set {
            userDefaults.set(newValue, forKey: PreferenceKeys.provider.rawValue)
        }
    }
    
    var initialSetupPassed: Bool {
        get {
            return userDefaults.bool(forKey: PreferenceKeys.onboardingPassed.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: PreferenceKeys.onboardingPassed.rawValue)
        }
    }
    
    // MARK: Init app
    
    func initializeApp() {
        userDefaults.set("InitializedApp", forKey: PreferenceKeys.initApp.rawValue)
    }
    
    private func isFirstRunApp() -> Bool {
        return userDefaults.string(forKey: PreferenceKeys.initApp.rawValue) == nil
    }
    
    // MARK: Clear
    
    private func clear() {
        userDefaults.removeObject(forKey: PreferenceKeys.theme.rawValue)
    }
    
}
