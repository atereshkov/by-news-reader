//
//  BookmarksTabRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol BookmarksTabRouterProtocol: class {
    static func initializeBookmarksModule(session: SessionType) -> ViewType
}

class BookmarksTabRouter: BookmarksTabRouterProtocol {
    
    class func initializeBookmarksModule(session: SessionType) -> UIViewController {
        let viewModel = BookmarksViewModel(session: session, delegate: nil)
        let view = UIDevice.isPhone ? StoryboardScene.Bookmarks.initialScene.instantiate() : StoryboardScene.BookmarksIPad.initialScene.instantiate()
        view.viewModel = viewModel
        let router = BookmarksRouter(session: session, view: view)
        viewModel.router = router
        return view
    }
    
}
