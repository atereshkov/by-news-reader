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
}

class PreferenceService: NSObject {
    
    static let shared = PreferenceService()
    
    fileprivate static let initApp = "initializeApp"
    
    // MARK: Init
    
    func initialize() {
        if isFirstRunApp() {
            clear()
            initializeApp()
        }
    }
    
    func initializeApp() {
        UserDefaults.standard.set(PreferenceService.initApp, forKey: PreferenceKeys.initApp.rawValue)
    }
    
    // MARK: Properties
    
    var theme: String {
        get {
            return UserDefaults.standard.string(forKey: PreferenceKeys.theme.rawValue) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: PreferenceKeys.theme.rawValue)
        }
    }
    
    var provider: Int {
        get {
            return UserDefaults.standard.integer(forKey: PreferenceKeys.provider.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: PreferenceKeys.provider.rawValue)
        }
    }
    
    // MARK: Clear
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: PreferenceKeys.theme.rawValue)
    }
    
    // MARK: Init app
    
    func isFirstRunApp() -> Bool {
        return UserDefaults.standard.string(forKey: PreferenceKeys.initApp.rawValue) == nil
    }
    
}
