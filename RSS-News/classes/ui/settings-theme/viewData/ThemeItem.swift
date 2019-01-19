//
//  ThemeItem.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol ThemeItemProtocol {
    var id: String { get }
    var title: String { get }
}

struct ThemeItem: ThemeItemProtocol {
    
    let id: String
    let title: String
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
}
