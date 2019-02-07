//
//  NewsDetailViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/21/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class NewsDetailViewModel: BaseViewModel<NewsDetailRouter>, NewsDetailViewModelType {
    
    private struct Constants {
        static let fullTimeFormat = "dd-MM-yyyy HH:mm"
    }
    
    // MARK: Callbacks
    
    var bookmarkStateChanged: ((Bool) -> Void)?
    
    // MARK: Properties
    
    private let item: MutableProperty<NewsItemProtocol?> = MutableProperty(nil)
    private let realmService: RealmServiceProtocol
    
    // MARK: Lifecycle
    
    init(session: SessionType, delegate: BaseViewDelegate?, item: NewsItemProtocol) {
        self.item.value = item
        self.realmService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
    }
    
    // MARK: Properties
    
    var previewActionItems: [UIPreviewActionItem] {
        guard let item = item.value else { return [] }
        var items: [UIPreviewActionItem] = []
        
        if !realmService.isBookmarked(item) {
            let addToBookmarksTitle = L10n.News.Preview.Action.addToBookmarks
            let addToBookmarksAction = UIPreviewAction(title: addToBookmarksTitle, style: .default) { [weak self] (_, _) in
                self?.addToBookmarksAction()
            }
            items.append(addToBookmarksAction)
        } else {
            let removeFromBookmarksTitle = L10n.News.Preview.Action.removeFromBookmarks
            let removeFromBookmarksAction = UIPreviewAction(title: removeFromBookmarksTitle, style: .destructive) { [weak self] (_, _) in
                self?.removeFromBookmarksAction()
            }
            items.append(removeFromBookmarksAction)
        }
        
        return items
    }
    
    var itemURL: URLRequest? {
        guard let link = item.value?.link else { return nil }
        guard let url = URL(string: link) else { return nil }
        return URLRequest(url: url)
    }
    
    var viewTitle: String? {
        return item.value?.category ?? item.value?.title
    }
    var isItemInBookmarks: Bool {
        guard let item = item.value else { return false }
        return realmService.isBookmarked(item)
    }
    
    var itemSource: Property<NSAttributedString?> {
        guard let source = item.value?.source else { return Property(value: nil) }
        let hostRaw = URL(string: source)?.host ?? ""
        let host = L10n.News.Item.Link.source(hostRaw)
        let result = NSAttributedString(string: host, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        return Property(value: result)
    }
    
    var pubDate: Property<String?> {
        guard let date = item.value?.pubDate else { return Property(value: nil) }
        let formatter = DateFormatters.with(format: Constants.fullTimeFormat)
        let timeAgoProvider = TimeAgoProvider(date: date, fullTimeFormatter: formatter)
        let timeAgo = timeAgoProvider.timeAgo()
        return Property(value: timeAgo)
    }
    
    var isLoading: MutableProperty<Bool> = MutableProperty(false)
    
    // MARK: Actions
    
    func sourceLinkTapAction() {
        guard let link = item.value?.link else { return }
        router?.openLink(link)
    }
    
    func shareAction(sender: UIView?) {
        guard let shareLink = item.value?.link else { return }
        router?.share(link: shareLink, sender: sender)
    }
    
    func bookmarkAction() {
        guard let item = item.value else { return }
        if !realmService.isBookmarked(item) {
            addToBookmarksAction()
        } else {
            removeFromBookmarksAction()
        }
    }
    
    func addToBookmarksAction() {
        guard let item = item.value else { return }
        realmService.addBookmarks([item])
        bookmarkStateChanged?(true)
        (delegate as? NewsDetailViewDelegate)?.addedToBookmarks(item)
    }
    
    func removeFromBookmarksAction() {
        guard let item = item.value else { return }
        realmService.removeBookmarks([item])
        bookmarkStateChanged?(false)
        (delegate as? NewsDetailViewDelegate)?.removedFromBookmarks(item)
    }
    
    func webViewDidFailLoad(error: Error) {
        
    }
    
    func webViewLoadingDidChange(_ isLoading: Bool) {
        self.isLoading.value = isLoading
    }
    
}

private extension NewsDetailViewModel {
    
    func setup() {
        
    }
    
}
