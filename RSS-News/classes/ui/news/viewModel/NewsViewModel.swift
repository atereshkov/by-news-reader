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
    
    var isLoading: Property<Bool> {
        return parseAction.isExecuting
    }
    
    var items: MutableProperty<[NewsItemProtocol]> = MutableProperty([])
    
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    
    private var provider: NewsProviderItemProtocol?
    
    private let parseService: ParseServiceProtocol
    private let realmService: RealmServiceProtocol
    private let providerService: ProvidersServiceProtocol
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.realmService = session.resolve()
        self.parseService = session.resolve()
        self.providerService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    // MARK: Actions
    
    func viewDidAppear() {
        updateState?(.reloadItems) // reload bookmarks state
    }
    
    func itemSelected(at index: Int) {
        guard let item = item(for: index) else { return }
        router?.goToNewsDetail(item: item, delegate: self)
    }
    
    func isBookmarked(_ index: Int) -> Bool {
        guard let item = item(for: index) else { return false }
        return realmService.isBookmarked(item)
    }
    
    func previewPopAction(view: ViewType) {
        router?.goTo(view)
    }
    
    func pullToRefreshAction() {
        guard let provider = provider else { return }
        parseItems(provider: provider)
    }
    
    // MARK: DataSource
    
    func item(for index: Int) -> NewsItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
    func detailView(for index: Int) -> ViewType? {
        guard let item = item(for: index) else { return nil }
        let view = PopTouchNewsDetailRouter.initializeView(session: session, item: item, delegate: self)
        return view
    }
    
    // MARK: Private
    
    private func parseItems(provider: NewsProviderItemProtocol) {
        guard let url = URL(string: provider.main.url) else { return }
        parseAction.apply(url).take(duringLifetimeOf: self).start()
    }
    
    private(set) lazy var parseAction: Action<URL, RSSFeed, ServiceError> = {
        return Action { [weak self] url in
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
        let currentProvider = AppProvider.currentProvider
        provider = providerService.getProviderItem(currentProvider)
        
        guard let provider = provider else { return }
        parseItems(provider: provider)
    }
    
}

extension NewsViewModel: NewsDetailViewDelegate {
    
    func addedToBookmarks(_ item: NewsItemProtocol) {
        updateState?(.reloadItems)
    }
    
    func removedFromBookmarks(_ item: NewsItemProtocol) {
        updateState?(.reloadItems)
    }
    
}
