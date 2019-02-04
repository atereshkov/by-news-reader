//
//  WidgetViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 2/4/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import FeedKit
import NotificationCenter

final class WidgetViewModel: BaseViewModel<WidgetRouter>, WidgetViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((WidgetViewState) -> Void)?
    
    // MARK: Properties
    
    var isLoading: Property<Bool> {
        return parseAction.isExecuting
    }
    
    var items: MutableProperty<[NewsItemProtocol]> = MutableProperty([])
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    
    private var bindDisposable: ScopedDisposable<AnyDisposable>?
    
    private var provider: NewsProviderItemProtocol?
    
    private let parseService: ParseServiceProtocol
    private var providerService: ProvidersServiceProtocol
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.parseService = session.resolve()
        self.providerService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    // MARK: Actions
    
    override func onViewDidLoad() {
        self.provider = providerService.getCurrentProviderItem()
        
        guard let actualProvider = self.provider else { return }
        parseItems(provider: actualProvider)
    }
    
    func itemSelected(at index: Int, context: NSExtensionContext?) {
        guard let item = item(for: index) else { return }
        guard let link = item.link else { return }
        guard let url = URL(string: link) else { return }
        context?.open(url, completionHandler: nil)
    }
    
    func fetchNewDataAction(completionHandler: @escaping ((NCUpdateResult) -> Void)) {
        guard let strUrl = provider?.latest.url else { return }
        guard let url = URL(string: strUrl) else { return }
        return parseService.parse(providerURL: url, completion: { [weak self] feed, _ in
            if let feed = feed {
                self?.handleRSSFeedResponse(feed)
                completionHandler(NCUpdateResult.newData)
            } else {
                completionHandler(NCUpdateResult.failed)
            }
        })
    }
    
    // MARK: DataSource
    
    func item(for index: Int) -> NewsItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
    // MARK: Private
    
    private func parseItems(provider: NewsProviderItemProtocol) {
        guard let url = URL(string: provider.latest.url) else { return }
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

private extension WidgetViewModel {
    
    func setup() {
        
    }
    
}
