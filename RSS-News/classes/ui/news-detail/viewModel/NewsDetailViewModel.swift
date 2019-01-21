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
    
    private let item: MutableProperty<NewsItemProtocol?> = MutableProperty(nil)
    
    init(session: SessionType, delegate: BaseViewDelegate?, item: NewsItemProtocol) {
        self.item.value = item
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
    }
    
    // MARK: Properties
    
    var itemURL: URLRequest? {
        guard let link = item.value?.link else { return nil }
        guard let url = URL(string: link) else { return nil }
        return URLRequest(url: url)
    }
    
    var viewTitle: String? {
        return item.value?.title
    }
    
    var isLoading: MutableProperty<Bool> = MutableProperty(false)
    
    // MARK: Actions
    
    func addToBookmarksAction() {
        
    }
    
    func removeFromBookmarksAction() {
        
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
