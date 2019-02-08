//
//  NewsItemTests.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest
@testable import RSS_News

class NewsItemTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testFromRealmObject() {
        let realmObject = RealmNewsItem(title: "String", iconURL: "IconURL", link: "Link", pubDate: Date(), category: "Category", source: "Source", isBookmarked: true, bookmarkDate: Date())
        let article: NewsItemProtocol = NewsItem.from(item: realmObject)
        XCTAssertEqual(realmObject.title, article.title)
        XCTAssertEqual(realmObject.iconURL, article.iconURL)
        XCTAssertEqual(realmObject.link, article.link)
        XCTAssertEqual(realmObject.pubDate, article.pubDate)
        XCTAssertEqual(realmObject.category, article.category)
        XCTAssertEqual(realmObject.source, article.source)
    }
    
}
