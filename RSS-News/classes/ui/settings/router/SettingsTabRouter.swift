//
//  SettingsTabRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol SettingsTabRouterProtocol: class {
    static func initializeSettingsModule(session: SessionType) -> ViewType
}

class SettingsTabRouter: SettingsTabRouterProtocol {
    
    class func initializeSettingsModule(session: SessionType) -> UIViewController {
        let viewModel = SettingsViewModel(session: session, delegate: nil)
        let view = StoryboardScene.Settings.initialScene.instantiate()
        view.viewModel = viewModel
        let router = SettingsRouter(session: session, view: view)
        viewModel.router = router
        return view
    }
    
}
