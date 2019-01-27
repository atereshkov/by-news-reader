//
//  NewsSourceProvider.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol NewsProviderItemProtocol {
    var name: String { get }
    var categories: [NewsCategoryProtocol] { get }
    var main: NewsCategoryProtocol { get }
    var latest: NewsCategoryProtocol { get }
    var order: Int? { get }
}

struct NewsProviderItem: NewsProviderItemProtocol {
    
    let name: String
    let categories: [NewsCategoryProtocol]
    let main: NewsCategoryProtocol
    let latest: NewsCategoryProtocol
    let order: Int?
    
}
