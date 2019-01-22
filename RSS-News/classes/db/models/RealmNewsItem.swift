//
//  RealmNewsItem.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/22/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import RealmSwift

class RealmNewsItem: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var iconURL: String = ""
    @objc dynamic var link: String = ""
    @objc dynamic var pubDate: Date = Date()
    
    @objc dynamic var isBookmarked: Bool = false
    @objc dynamic var bookmarkDate: Date = Date()
    
    override static func primaryKey() -> String? {
        return "link"
    }
    
    convenience init(title: String, iconURL: String, link: String, pubDate: Date, isBookmarked: Bool, bookmarkDate: Date = Date()) {
        self.init()
        self.title = title
        self.iconURL = iconURL
        self.link = link
        self.pubDate = pubDate
        self.isBookmarked = isBookmarked
        self.bookmarkDate = bookmarkDate
    }
    
}

extension RealmNewsItem {
    
    static func from(item: NewsItemProtocol, isBookmarked: Bool = false) -> RealmNewsItem {
        let wallpaper = RealmNewsItem()
        wallpaper.link = item.link ?? ""
        wallpaper.iconURL = item.iconURL
        wallpaper.title = item.title
        wallpaper.pubDate = item.pubDate ?? Date()
        wallpaper.isBookmarked = isBookmarked
        wallpaper.bookmarkDate = Date()
        return wallpaper
    }
    
}

enum RealmNewsItemOrder {
    case favoriteDate
    
    var ordering: (RealmNewsItem, RealmNewsItem) -> Bool {
        switch self {
        case .favoriteDate:
            return { $0.bookmarkDate > $1.bookmarkDate }
        }
    }
}

extension Sequence where Element == RealmNewsItem {
    func sorted(by columnOrder: RealmNewsItemOrder) -> [Element] {
        return sorted(by: columnOrder.ordering)
    }
}