//
//  NewsSourceProvider.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol NewsSourceProviderProtocol {
    var url: String { get }
}

struct NewsSourceProvider: NewsSourceProviderProtocol {
    
    let url: String
    
}
