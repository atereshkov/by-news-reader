//
//  NewsTabRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol NewsTabRouterProtocol: class {
    static func initializeNewsModule(session: SessionType) -> ViewType
}

class NewsTabRouter: NewsTabRouterProtocol {
    
    class func initializeNewsModule(session: SessionType) -> UIViewController {
        let viewModel = NewsViewModel(session: session, delegate: nil)
        let view = StoryboardScene.News.initialScene.instantiate()
        view.viewModel = viewModel
        let router = NewsRouter(session: session, view: view)
        viewModel.router = router
        return view
    }
    
}
