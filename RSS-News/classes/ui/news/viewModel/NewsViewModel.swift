//
//  NewsViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import FeedKit

final class NewsViewModel: BaseViewModel<NewsRouter>, NewsViewModelType {
    
    private let parseService: ParseServiceProtocol
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.parseService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
        parse()
    }
    
    private func parse() {
        parseAction.apply().take(duringLifetimeOf: self).start()
    }
    
    private(set) lazy var parseAction: Action<Void, RSSFeed, ServiceError> = {
        let url = URL(string: "https://news.tut.by/rss/all.rss")!
        
        return Action { [weak self] in
            guard let strongSelf = self else { return .empty }
            return strongSelf
                .parseService
                .parse(providerURL: url)
                .observe(on: UIScheduler())
                .on(value: { [weak self] feed in
                    Swift.print("Feed: \(feed.items?.count)")
                })
        }
    }()
    
}

private extension NewsViewModel {
    
    func setup() {
        
    }
    
}
