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
    func parse(providerURL: URL) -> SignalProducer<RSSFeed, ServiceError>
}

final class ParseService: ParseServiceProtocol {
    
    func parse(providerURL: URL) -> SignalProducer<RSSFeed, ServiceError> {
        return SignalProducer { observer, _ in
            let parser = FeedParser(URL: providerURL)
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
