//
//  NewsDetailView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/21/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import WebKit
import ReactiveCocoa
import ReactiveSwift

final class NewsDetailView: BaseView<NewsDetailViewModel>, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    private var webViewLoadingObserver: NSKeyValueObservation?
    private var webViewTitleObserver: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupObservers()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        guard let viewModel = viewModel else { return }
        
        activityIndicator.reactive.isAnimating <~ viewModel.isLoading
        //webView.reactive.isHidden <~ viewModel.isLoading
        
        viewModel.bookmarkStateChanged = { [weak self] isBookmarked in
            self?.addRightBarButtons(isBookmarked: isBookmarked)
        }
        
        guard let itemURL = viewModel.itemURL else { return }
        webView.load(itemURL)
    }
    
    // MARK: WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        viewModel?.webViewDidFailLoad(error: error)
    }
    
    // MARK: WKUIDelegate
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        return viewModel?.previewActionItems ?? []
    }
    
}

private extension NewsDetailView {
    
    func setupView() {
        self.title = viewModel?.viewTitle
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        let isItemInBookmarks = viewModel?.isItemInBookmarks ?? false
        addRightBarButtons(isBookmarked: isItemInBookmarks)
    }
    
    func addRightBarButtons(isBookmarked: Bool) {
        let shareButton: UIBarButtonItem = .shareButton { [weak self] in
            self?.viewModel?.shareAction()
        }
        var bookmarkButton: UIBarButtonItem = UIBarButtonItem()
        if isBookmarked {
            bookmarkButton = .bookmarkedButton { [weak self] in
                self?.viewModel?.bookmarkAction()
            }
        } else {
            bookmarkButton = .bookmarkEmptyButton { [weak self] in
                self?.viewModel?.bookmarkAction()
            }
        }
        navigationItem.rightBarButtonItems = [shareButton, .spacer(), bookmarkButton]
    }
    
    func setupObservers() {
        self.webViewLoadingObserver = webView.observe(\.isLoading, options: [.initial, .old, .new]) { [weak self] (_, change) in
            guard let newValue = change.newValue else { return }
            self?.viewModel?.webViewLoadingDidChange(newValue)
        }
//        self.webViewTitleObserver = webView.observe(\.title, options: [.new]) { [weak self] (_, change) in
//            guard let newTitle = change.newValue else { return }
//            self?.title = newTitle
//        }
    }
    
}
