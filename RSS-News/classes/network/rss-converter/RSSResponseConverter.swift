//
//  RSSResponseConverter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import FeedKit

class RSSReponseConverter: ResponseConverter {
    
    private let feed: RSSFeed?
    
    init(feed: RSSFeed) {
        self.feed = feed
    }
    
    // MARK: API
    
    func getCategoryNews() -> [CategoryNewsItemProtocol] {
        guard let feed = feed, let feedItems = feed.items else { return [] }
        var items: [CategoryNewsItemProtocol] = []
        
        for item in feedItems {
            let title = item.title
            let images = item.media?.mediaContents?
                .filter({ $0.attributes?.type?.contains("image") ?? false })
                .compactMap({ $0 })
            let iconURL = images?.first?.attributes?.url ?? ""
            
            let newsItem = CategoryNewsItem(title: title ?? "", iconURL: iconURL)
            items.append(newsItem)
        }
        
        return items
    }
    
}
