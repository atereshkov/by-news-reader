//
//  OnboardingPageManagerTests.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest
@testable import RSS_News

class OnboardingPageManagerTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testInitializationWithSession() {
        let session: SessionType = Session()
        let manager = OnboardingPageManager(session: session)
        XCTAssertNotNil(manager.session)
    }
    
    func testViewsInitializationPositive() {
        let session: SessionType = Session()
        let manager: OnboardingPageManagerProtocol = OnboardingPageManager(session: session)
        XCTAssertEqual(manager.views.count, 0)
        manager.initializeViews()
        XCTAssertGreaterThan(manager.views.count, 0)
    }
    
}
