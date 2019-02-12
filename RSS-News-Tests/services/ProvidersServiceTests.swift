//
//  ProvidersServiceTests.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/10/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest
@testable import RSS_News

class ProvidersServiceTests: XCTestCase {
    
    private var providersService: ProvidersServiceProtocol!
    
    override func setUp() {
        UserDefaults().removePersistentDomain(forName: #file)
        let mockUserDefaults = UserDefaults(suiteName: #file)!
        
        let preferenceService: AppPreferenceServiceProtocol = AppPreferenceService(userDefaults: mockUserDefaults)
        let repository = PlistProvidersRepository(plistName: "FakeProviders")
        let providersParser: ProvidersParserProtocol = ProvidersParser(repository)
        providersService = ProvidersService(providersParser, preferenceService)
    }
    
    override func tearDown() {
        
    }
    
    func testSetupThemePositive() {
        
    }
    
}
