//
//  RealmNewsItem.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest
@testable import RSS_News

class RealmNewsItemTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testRealmObjectFromNewsItemFull() {
        let newsItem: NewsItemProtocol = NewsItem(title: "Title", iconURL: "IconURL", pubDate: Date(), link: "Link", category: "Category", source: "Source")
        let realmObject = RealmNewsItem.from(item: newsItem)
        XCTAssertEqual(newsItem.title, realmObject.title)
        XCTAssertEqual(newsItem.iconURL, realmObject.iconURL)
        XCTAssertEqual(newsItem.pubDate, realmObject.pubDate)
        XCTAssertEqual(newsItem.link, realmObject.link)
        XCTAssertEqual(newsItem.category, realmObject.category)
        XCTAssertEqual(newsItem.source, realmObject.source)
    }
    
    func testRealmObjectFromNewsItemEmpty() {
        let newsItem: NewsItemProtocol = NewsItem(title: "Title", iconURL: "IconURL", pubDate: nil, link: nil, category: nil, source: nil)
        let realmObject = RealmNewsItem.from(item: newsItem)
        XCTAssertEqual(newsItem.title, realmObject.title)
        XCTAssertEqual(newsItem.iconURL, realmObject.iconURL)
        XCTAssertEqual(newsItem.pubDate, realmObject.pubDate)
        XCTAssertEqual(newsItem.link, realmObject.link)
        XCTAssertEqual(newsItem.category, realmObject.category)
        XCTAssertEqual(newsItem.source, realmObject.source)
    }
    
}
