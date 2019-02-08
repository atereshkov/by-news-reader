//
//  AppThemeServiceTests.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest
@testable import RSS_News

class AppThemeServiceTests: XCTestCase {
    
    private var preferenceService: AppPreferenceServiceProtocol!
    private var appThemeService: AppThemeServiceProtocol!
    
    override func setUp() {
        UserDefaults().removePersistentDomain(forName: #file)
        let mockUserDefaults = UserDefaults(suiteName: #file)!
        
        preferenceService = AppPreferenceService(userDefaults: mockUserDefaults)
        appThemeService = AppThemeService(preferenceService)
    }
    
    override func tearDown() {
        
    }
    
    func testSetupThemePositive() {
        preferenceService.theme = AppTheme.dark.rawValue
        appThemeService.setupTheme() // set theme from preferenceService
        let currentTheme = appThemeService.currentTheme
        XCTAssertEqual(AppTheme.dark, currentTheme)
    }
    
    func testSetupThemeNegative() {
        appThemeService.setupTheme()
        let currentTheme = appThemeService.currentTheme
        let defaultTheme = appThemeService.defaultTheme
        XCTAssertEqual(defaultTheme, currentTheme)
    }
    
    func testCurrentThemeNegative() {
        let currentTheme = appThemeService.currentTheme
        let defaultTheme = appThemeService.defaultTheme
        XCTAssertEqual(defaultTheme, currentTheme)
    }
    
}
