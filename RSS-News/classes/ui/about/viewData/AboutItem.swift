//
//  AboutItem.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/29/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol AboutListItemProtocol {
    var cellIdentifier: String { get }
    var showSeparator: Bool { get }
}

struct AboutListItem: AboutListItemProtocol {
    
    let text: String
    let cellIdentifier: String = "AboutCell"
    let showSeparator: Bool
    
    init(text: String, showSeparator: Bool = true) {
        self.text = text
        self.showSeparator = showSeparator
    }
    
}

struct AboutTitleItem: AboutListItemProtocol {
    
    let cellIdentifier: String = "AboutTitleCell"
    let showSeparator: Bool = false
    let title: String
    
}
