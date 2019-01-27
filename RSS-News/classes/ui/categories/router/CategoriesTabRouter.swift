//
//  CategoriesTabRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol CategoriesTabRouterProtocol: class {
    static func initializeCategoriesModule(session: SessionType) -> ViewType
}

class CategoriesTabRouter: CategoriesTabRouterProtocol {
    
    class func initializeCategoriesModule(session: SessionType) -> UIViewController {
        let viewModel = CategoriesViewModel(session: session, delegate: nil)
        let view = UIDevice.isPhone ? StoryboardScene.Categories.initialScene.instantiate() : StoryboardScene.CategoriesIPad.initialScene.instantiate()
        view.viewModel = viewModel
        let router = CategoriesRouter(session: session, view: view)
        viewModel.router = router
        return view
    }
    
}
