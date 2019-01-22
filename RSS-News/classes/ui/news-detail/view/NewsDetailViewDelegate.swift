//
//  NewsDetailViewDelegate.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/22/19.
//  Copyright © 2019 AT. All rights reserved.
//

protocol NewsDetailViewDelegate: BaseViewDelegate {
    func removedFromBookmarks(_ item: NewsItemProtocol)
    func addedToBookmarks(_ item: NewsItemProtocol)
}
