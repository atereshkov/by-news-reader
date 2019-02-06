//
//  NewsDetailViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/21/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

protocol NewsDetailViewModelType: ViewModelType {
    
    // MARK: Callbacks
    
    var bookmarkStateChanged: ((_ isBookmarked: Bool) -> Void)? { get set }
    
    // MARK: Actions
    
    func shareAction(sender: UIView?)
    func bookmarkAction()
    func addToBookmarksAction()
    func removeFromBookmarksAction()
    func sourceLinkTapAction()
    
    func webViewLoadingDidChange(_ isLoading: Bool)
    func webViewDidFailLoad(error: Error)
    
    // MARK: Datasource
    
    var itemURL: URLRequest? { get }
    var viewTitle: String? { get }
    var isItemInBookmarks: Bool { get }
    var itemSource: Property<NSAttributedString?> { get }
    var pubDate: Property<String?> { get }
    
    var isLoading: MutableProperty<Bool> { get }
    
    var previewActionItems: [UIPreviewActionItem] { get }
    
}
