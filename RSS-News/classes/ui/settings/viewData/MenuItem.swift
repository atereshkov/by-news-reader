//
//  MenuItem.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

enum MenuListItemType: Int {
    case city
    case source
    case textSize
    case theme
    case about
}

protocol MenuListItemProtocol {
    var cellIdentifier: String { get }
    var showSeparator: Bool { get }
}

struct MenuListItem: MenuListItemProtocol {
    
    let title: String
    let value: String?
    let type: MenuListItemType
    let cellIdentifier: String = "MenuCell"
    let showSeparator: Bool
    
    init(title: String, value: String?, type: MenuListItemType, showSeparator: Bool = true) {
        self.title = title
        self.value = value
        self.type = type
        self.showSeparator = showSeparator
    }
    
}

struct MenuEmptyItem: MenuListItemProtocol {
    
    let cellIdentifier: String = "MenuEmptyCell"
    let showSeparator: Bool = false
    
}
