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
    func parse(providerURL: URL, completion: @escaping ((RSSFeed?, Error?) -> Void))
}

final class ParseService: ParseServiceProtocol {
    
    func parse(providerURL: URL) -> SignalProducer<RSSFeed, ServiceError> {
        return SignalProducer { observer, _ in
            let parser = FeedParser(URL: providerURL)
            parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
                switch result {
                case .success(let feed):
                    guard let feed = feed.rssFeed else {
                        observer.send(error: .unknown)
                        observer.sendCompleted()
                        return
                    }
                    
                    observer.send(value: feed)
                    observer.sendCompleted()
                case .failure(let error):
                    observer.send(error: .parseError(error))
                    observer.sendCompleted()
                    return
                }
            }
        }
    }
    
    func parse(providerURL: URL, completion: @escaping ((RSSFeed?, Error?) -> Void)) {
        let parser = FeedParser(URL: providerURL)
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            switch result {
            case .success(let feed):
                guard let feed = feed.rssFeed else {
                    completion(nil, ServiceError.unknown)
                    return
                }
                completion(feed, nil)
            case .failure(let error):
                completion(nil, error)
                return
            }
        }
    }
    
}
