//
//  RealmServiceTests.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 2/7/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest
@testable import RSS_News
@testable import RealmSwift

class RealmServiceTests: XCTestCase {
    
    private let realmService: RealmServiceProtocol = RealmService()
    
    override func setUp() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(inMemoryIdentifier: UUID().uuidString)
    }
    
    override func tearDown() {
        
    }
    
    func addToBookmarksTest() {
        let article = NewsItem(title: "String", iconURL: "String", pubDate: Date(), link: "String", category: "String", source: "String")
        realmService.addBookmarks([article])
        let objectsCount = realmService.allBookmarks().count
        XCTAssertEqual(objectsCount, 1, "Fail")
    }
    
}
