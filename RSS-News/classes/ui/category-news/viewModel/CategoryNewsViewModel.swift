//
//  CategoryNewsViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import FeedKit

final class CategoryNewsViewModel: BaseViewModel<CategoryNewsRouter>, CategoryNewsViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((CategoryNewsViewState) -> Void)?
    
    // MARK: Properties
    
    var noInternetViewIsHidden: Property<Bool> {
        let isHidden = Property.combineLatest(isLoading, isInternetReachable).map { (isLoading, isInternetReachable) in
            return isLoading == true || isInternetReachable
        }
        return isHidden
    }
    var tableViewIsHidden: Property<Bool> {
        let isHidden = Property.combineLatest(isInternetReachable, isLoading).map { (isInternetReachable, isLoading) in
            return !isInternetReachable || isLoading
        }
        return isHidden
    }
    
    var isInternetReachable: MutableProperty<Bool> {
        return reachabilityService.isReachable
    }
    
    var items: MutableProperty<[NewsItemProtocol]> = MutableProperty([])
    
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    var screenTitle: Property<String> {
        return item.map { $0?.name.localized ?? "" }
    }
    var isLoading: Property<Bool> {
        return parseAction.isExecuting
    }
    
    private let item: MutableProperty<NewsCategoryProtocol?> = MutableProperty(nil)
    
    private let parseService: ParseServiceProtocol
    private let realmService: RealmServiceProtocol
    private let reachabilityService: ReachabilityServiceProtocol
    
    // MARK: Init
    
    init(item: NewsCategoryProtocol, session: SessionType, delegate: BaseViewDelegate?) {
        self.parseService = session.resolve()
        self.realmService = session.resolve()
        self.reachabilityService = session.resolve()
        self.item.value = item
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
        
        parseItems()
    }
    
    // MARK: Actions
    
    func itemSelected(at index: Int) {
        guard let item = item(for: index) else { return }
        router?.goToNewsDetail(item: item, delegate: self)
    }
    
    func previewPopAction(view: ViewType) {
        router?.goTo(view)
    }
    
    func pullToRefreshAction() {
        parseItems()
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
    
    func isBookmarked(_ index: Int) -> Bool {
        guard let item = item(for: index) else { return false }
        return realmService.isBookmarked(item)
    }
    
    // MARK: Network
    
    private func parseItems() {
        guard let item = item.value else { return }
        parseAction.apply(item).take(duringLifetimeOf: self).start()
    }
    
    private(set) lazy var parseAction: Action<NewsCategoryProtocol, RSSFeed, ServiceError> = {
        return Action { [weak self] item in
            guard let strongSelf = self else { return .empty }
            guard let url = URL(string: item.url) else { return .empty }
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

private extension CategoryNewsViewModel {
    
    func setup() {
        
    }
    
}

extension CategoryNewsViewModel: NewsDetailViewDelegate {
    
    func addedToBookmarks(_ item: NewsItemProtocol) {
        parseItems()
    }
    
    func removedFromBookmarks(_ item: NewsItemProtocol) {
        parseItems()
    }
    
}
