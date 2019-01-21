//
//  PopTouchNewsDetailRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/21/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol PopTouchNewsDetailRouterProtocol: class {
    static func initializeView(session: SessionType) -> ViewType
}

class PopTouchNewsDetailRouter: PopTouchNewsDetailRouterProtocol {
    
    class func initializeView(session: SessionType) -> UIViewController {
        let viewModel = NewsDetailViewModel(session: session, delegate: nil)
        let view = StoryboardScene.NewsDetail.initialScene.instantiate()
        view.viewModel = viewModel
        let router = NewsDetailRouter(session: session, view: view)
        viewModel.router = router
        return view
    }
    
}
