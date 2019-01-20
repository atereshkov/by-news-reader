//
//  CategoryNewsItem.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol CategoryNewsItemProtocol {
    var title: String { get }
    var iconURL: String { get }
    var publishDate: Date? { get }
}

struct CategoryNewsItem: CategoryNewsItemProtocol {
    
    let title: String
    let iconURL: String
    let publishDate: Date?
    
}
