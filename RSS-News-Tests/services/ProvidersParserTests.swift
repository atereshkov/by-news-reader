//
//  ProvidersParserServiceTests.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/10/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest
@testable import RSS_News

class ProvidersParserTests: XCTestCase {
    
    private var providersParser: ProvidersParserProtocol!
    
    override func setUp() {
        let repository = PlistProvidersRepository(plistName: "FakeProviders")
        providersParser = ProvidersParser(repository)
    }
    
    override func tearDown() {
        
    }
    
    func testParseFullProvider() {
        let providerName = "FullProvider"
        let item = providersParser.parseItem(providerName)
        
        XCTAssertNotNil(item)
    }
    
}
