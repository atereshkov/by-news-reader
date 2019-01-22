//
//  CategoryNewsItem.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol NewsItemProtocol {
    var title: String { get }
    var iconURL: String { get }
    var pubDate: Date? { get }
    var link: String? { get }
}

struct NewsItem: NewsItemProtocol {
    
    let title: String
    let iconURL: String
    let pubDate: Date?
    let link: String?
    
}

extension NewsItem {
    
    static func from(item: RealmNewsItem) -> NewsItemProtocol {
        let newsItem = NewsItem(title: item.title, iconURL: item.iconURL, pubDate: item.pubDate, link: item.link)
        return newsItem
    }
    
}
