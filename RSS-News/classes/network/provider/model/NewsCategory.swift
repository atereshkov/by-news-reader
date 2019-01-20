//
//  NewsCategory.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol NewsCategoryProtocol {
    var name: String { get }
    var url: String { get }
}

struct NewsCategory: NewsCategoryProtocol {
    
    let name: String
    let url: String
    
}
