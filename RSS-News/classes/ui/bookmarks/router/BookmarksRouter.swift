//
//  BookmarksRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol BookmarksRouterType: RouterType, NewsDetailRoutable {
    func goTo(_ view: ViewType)
}

final class BookmarksRouter: BaseRouter, BookmarksRouterType {
    
    func goTo(_ view: ViewType) {
        self.view?.navigationController?.pushViewController(view, animated: true)
    }
    
}
