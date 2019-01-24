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
    
    func getNewsItems() -> [NewsItemProtocol] {
        guard let feed = feed, let feedItems = feed.items else { return [] }
        var items: [NewsItemProtocol] = []
        
        for item in feedItems {
            let title = item.title
            let images = getImages(item: item)
            let iconURL = images.first?.attributes?.url ?? ""
            let date = item.pubDate
            let link = item.guid?.value
            let category = item.categories?.first?.value
            
            let newsItem = NewsItem(title: title ?? "", iconURL: iconURL, pubDate: date, link: link, category: category)
            items.append(newsItem)
        }
        
        return items
    }
    
    private func getImages(item: RSSFeedItem) -> [MediaContent] {
        let images = item.media?.mediaContents?
            .filter({ $0.attributes?.type?.contains("image") ?? false })
            .compactMap({ $0 })
        return images ?? []
    }
    
}
