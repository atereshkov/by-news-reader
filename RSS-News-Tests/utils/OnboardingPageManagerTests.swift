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
    
    var provider: RoutesProviderProtocol!
    var manager: OnboardingPageManagerProtocol!
    
    override func setUp() {
        let session: SessionType = Session()
        provider = OnboardingRoutesProvider(session: session)
        manager = OnboardingPageManager(session: session, provider: provider)
    }
    
    override func tearDown() {
        
    }
    
    func testInitializationWithSession() {
        XCTAssertNotNil(manager.session)
    }
    
    func testViewsInitializationPositive() {
        let viewsCount = provider.getViews().count
        XCTAssertEqual(manager.views.count, viewsCount)
    }
    
    // MARK: viewAfter(:)
    
    func testViewAfter() {
        let session: SessionType = Session()
        let mockProvider = MockRoutesProvider()
        let manager = OnboardingPageManager(session: session, provider: mockProvider)
        let view1 = manager.views[0]
        let view2 = manager.views[1]
        let viewAfterView1 = manager.viewAfter(view1)
        XCTAssertEqual(viewAfterView1, view2)
    }
    
    func testViewAfterCycle() {
        let session: SessionType = Session()
        let mockProvider = MockRoutesProvider()
        let manager = OnboardingPageManager(session: session, provider: mockProvider)
        let view1 = manager.views[0]
        let view2 = manager.views[1]
        let viewAfterView2 = manager.viewAfter(view2)
        XCTAssertEqual(viewAfterView2, view1)
    }
    
    func testViewAfterNegative() {
        let session: SessionType = Session()
        let mockProvider = MockRoutesProvider()
        let manager = OnboardingPageManager(session: session, provider: mockProvider)
        let view2 = manager.views[0]
        let viewAfterView1 = manager.viewAfter(UIViewController())
        XCTAssertNotEqual(viewAfterView1, view2)
    }
    
    // MARK: viewBefore(:)
    
    func testViewBefore() {
        let session: SessionType = Session()
        let mockProvider = MockRoutesProvider()
        let manager = OnboardingPageManager(session: session, provider: mockProvider)
        let view1 = manager.views[0]
        let view2 = manager.views[1]
        let viewBeforeView2 = manager.viewBefore(view2)
        XCTAssertEqual(viewBeforeView2, view1)
    }
    
    func testViewBeforeCycle() {
        let session: SessionType = Session()
        let mockProvider = MockRoutesProvider()
        let manager = OnboardingPageManager(session: session, provider: mockProvider)
        let view1 = manager.views[0]
        let view2 = manager.views[1]
        let viewBeforeView1 = manager.viewBefore(view1)
        XCTAssertEqual(viewBeforeView1, view2)
    }
    
    func testViewBeforeNegative() {
        let session: SessionType = Session()
        let mockProvider = MockRoutesProvider()
        let manager = OnboardingPageManager(session: session, provider: mockProvider)
        let view1 = manager.views[0]
        let viewBeforeView2 = manager.viewBefore(UIViewController())
        XCTAssertNotEqual(viewBeforeView2, view1)
    }
    
}
