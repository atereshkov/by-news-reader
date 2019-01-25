//
//  RegionItem.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol RegionItemProtocol {
    var id: String { get }
    var name: String { get }
}

struct RegionItem: RegionItemProtocol {
    
    let id: String
    let name: String
    
}
