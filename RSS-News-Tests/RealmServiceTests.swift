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
        realmService.deleteAll()
    }
    
    func testAddToBookmarks() {
        let article = NewsItem(title: "String", iconURL: "String", pubDate: Date(), link: "String", category: "String", source: "String")
        realmService.addBookmarks([article])
        let objectsCount = realmService.allBookmarks().count
        XCTAssertEqual(objectsCount, 1)
    }
    
    func testRemoveFromBookmarks() {
        let article = NewsItem(title: "String", iconURL: "String", pubDate: Date(), link: "String", category: "String", source: "String")
        realmService.addBookmarks([article])
        realmService.removeBookmarks([article])
        let objectsCount = realmService.allBookmarks().count
        XCTAssertEqual(objectsCount, 0)
    }
    
    func testIsBookmarkedTrue() {
        let article = NewsItem(title: "String", iconURL: "String", pubDate: Date(), link: "String", category: "String", source: "String")
        realmService.addBookmarks([article])
        let isBookmarked = realmService.isBookmarked(article)
        XCTAssertEqual(isBookmarked, true)
    }
    
    func testIsBookmarkedFalse() {
        let article = NewsItem(title: "String", iconURL: "String", pubDate: Date(), link: "String", category: "String", source: "String")
        let isBookmarked = realmService.isBookmarked(article)
        XCTAssertEqual(isBookmarked, false)
    }
    
    func testIsInWriteTransactionFalse() {
        let isInWriteTransaction = realmService.isInWriteTransaction
        XCTAssertEqual(isInWriteTransaction, false)
    }
    
    func testAllBookmarks() {
        let article = NewsItem(title: "String", iconURL: "String", pubDate: Date(), link: "Link1", category: "String", source: "String")
        let article2 = NewsItem(title: "String", iconURL: "String", pubDate: Date(), link: "Link2", category: "String", source: "String")
        let article3 = NewsItem(title: "String", iconURL: "String", pubDate: Date(), link: "Link3", category: "String", source: "String")
        
        realmService.addBookmarks([article, article2, article3])
        realmService.removeBookmarks([article3])
        let allBookmarksCount = realmService.allBookmarks().count
        
        XCTAssertEqual(allBookmarksCount, 2)
    }
    
}
