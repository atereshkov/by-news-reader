//
//  CategoryNewsRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryNewsRouterType: RouterType {
    func openLink(_ url: String)
}

final class CategoryNewsRouter: BaseRouter, CategoryNewsRouterType {
    
    func openLink(_ url: String) {
        guard let url = URL(string: url), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
    
}
