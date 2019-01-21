//
//  CategoryNewsRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryNewsRouterType: RouterType, NewsDetailRoutable {
    func openLink(_ url: String)
    func goTo(_ view: ViewType)
}

final class CategoryNewsRouter: BaseRouter, CategoryNewsRouterType {
    
    func openLink(_ url: String) {
        guard let url = URL(string: url), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
    
    func goTo(_ view: ViewType) {
        self.view?.navigationController?.pushViewController(view, animated: true)
    }
    
}
