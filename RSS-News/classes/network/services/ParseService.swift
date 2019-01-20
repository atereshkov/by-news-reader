//
//  ParseService.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import Alamofire
import ReactiveSwift
import Result
import FeedKit

protocol ParseServiceProtocol {
    func parse(provider: NewsSourceProviderProtocol) -> SignalProducer<RSSFeed, ServiceError>
}

final class ParseService: ParseServiceProtocol {
    
    func parse(provider: NewsSourceProviderProtocol) -> SignalProducer<RSSFeed, ServiceError> {
        return SignalProducer { [weak self] observer, _ in
            let feedURL = URL(string: provider.url)!
            let parser = FeedParser(URL: feedURL)
            parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
                guard let feed = result.rssFeed, result.isSuccess else {
                    observer.send(error: .parseError(result.error))
                    observer.sendCompleted()
                    return
                }
                observer.send(value: feed)
                observer.sendCompleted()
            }
        }
    }
    
}
