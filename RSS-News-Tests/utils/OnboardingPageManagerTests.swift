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
        let provider: RoutesProviderProtocol = OnboardingRoutesProvider(session: session)
        let manager = OnboardingPageManager(session: session, provider: provider)
        XCTAssertNotNil(manager.session)
    }
    
    func testViewsInitializationPositive() {
        let session: SessionType = Session()
        let provider: RoutesProviderProtocol = OnboardingRoutesProvider(session: session)
        let manager: OnboardingPageManagerProtocol = OnboardingPageManager(session: session, provider: provider)
        let viewsCount = provider.getViews().count
        XCTAssertEqual(manager.views.count, viewsCount)
    }
    
}
