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
    
    // MARK: Callbacks
    
    var updateState: ((NewsViewState) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[NewsItemProtocol]> = MutableProperty([])
    
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    
    private let item: MutableProperty<NewsCategoryProtocol?> = MutableProperty(nil)
    
    private let parseService: ParseServiceProtocol
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.parseService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
        parse()
    }
    
    // MARK: Actions
    
    func itemSelected(at index: Int) {
        guard let item = item(for: index) else { return }
        router?.goToNewsDetail(item: item)
    }
    
    func previewPopAction(view: ViewType) {
        router?.goTo(view)
    }
    
    // MARK: DataSource
    
    func item(for index: Int) -> NewsItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
    func detailView(for index: Int) -> ViewType? {
        guard let item = item(for: index) else { return nil }
        let view = PopTouchNewsDetailRouter.initializeView(session: session, item: item)
        return view
    }
    
    // MARK: Private
    
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
                    self?.handleRSSFeedResponse(feed)
                })
        }
    }()
    
    private func handleRSSFeedResponse(_ feed: RSSFeed) {
        let converter = RSSReponseConverter(feed: feed)
        let convertedItems = converter.getNewsItems()
        items.value = convertedItems
        updateState?(.reloadItems)
    }
    
}

private extension NewsViewModel {
    
    func setup() {
        
    }
    
}
