//
//  PreferenceServiceTests.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest
@testable import RSS_News

class PreferenceServiceTests: XCTestCase {
    
    private var preferenceService: AppPreferenceServiceProtocol!
    
    override func setUp() {
        UserDefaults().removePersistentDomain(forName: #file)
        let mockUserDefaults = UserDefaults(suiteName: #file)!
        
        preferenceService = AppPreferenceService(userDefaults: mockUserDefaults)
    }
    
    override func tearDown() {
        
    }
    
    // MARK: Theme
    
    func testThemePreferencePositive() {
        let theme = AppTheme.dark.rawValue
        preferenceService.theme = theme
        let themeFromPreferences = preferenceService.theme
        XCTAssertEqual(theme, themeFromPreferences)
    }
    
    func testThemePreferenceNegative() {
        let themeFromPreferences = preferenceService.theme
        XCTAssertEqual("", themeFromPreferences)
    }
    
    // MARK: Provider
    
    func testProviderPreferencePositive() {
        let provider = AppProviderEnum.onlinerBy.rawValue
        preferenceService.provider = provider
        let providerFromPreferences = preferenceService.provider
        XCTAssertEqual(provider, providerFromPreferences)
    }
    
    func testProviderPreferenceNegative() {
        let providerFromPreferences = preferenceService.provider
        XCTAssertEqual("", providerFromPreferences)
    }
    
    // MARK: Initial setup
    
    func testInitialSetupPassedPreferencePositive() {
        let initialSetupPassed = true
        preferenceService.initialSetupPassed = initialSetupPassed
        let initialSetupPassedFromPreferences = preferenceService.initialSetupPassed
        XCTAssertEqual(initialSetupPassed, initialSetupPassedFromPreferences)
    }
    
    func testInitialSetupPassedPreferenceNegative() {
        let initialSetupPassedFromPreferences = preferenceService.initialSetupPassed
        XCTAssertEqual(false, initialSetupPassedFromPreferences)
    }
    
}
