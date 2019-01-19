//
//  NewsRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol NewsRoutable {
    func goToNews()
}

extension NewsRoutable where Self: RouterType {
    
    func goToNews() {
        
    }
    
}
