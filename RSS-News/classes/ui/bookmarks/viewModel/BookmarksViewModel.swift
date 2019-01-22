//
//  BookmarksViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

final class BookmarksViewModel: BaseViewModel<BookmarksRouter>, BookmarksViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((BookmarksViewState) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[NewsItemProtocol]> = MutableProperty([])
    
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    var isEmpty: Property<Bool> {
        return items.map { $0.isEmpty }
    }
    
    private let realmService: RealmServiceProtocol
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.realmService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    // MARK: Actions
    
    func viewWillAppear() {
        fetchItems()
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
    
    private func fetchItems() {
        items.value = realmService
            .allBookmarks()
            .map({ NewsItem.from(item: $0) })
        
        updateState?(.reloadItems)
    }
    
}

private extension BookmarksViewModel {
    
    func setup() {
        
    }
    
}

extension BookmarksViewModel: NewsDetailViewDelegate {
    
    func addedToBookmarks(_ item: NewsItemProtocol) {
        fetchItems()
    }
    
    func removedFromBookmarks(_ item: NewsItemProtocol) {
        fetchItems()
    }
    
}
