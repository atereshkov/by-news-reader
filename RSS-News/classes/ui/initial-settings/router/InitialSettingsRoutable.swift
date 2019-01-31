//
//  InitialSettingsRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol InitialSettingsRoutable {
    func goToInitialSettings(animated: Bool)
}

extension InitialSettingsRoutable where Self: RouterType {
    
    func goToInitialSettings(animated: Bool = false) {
        let viewModel = InitialSettingsViewModel(session: session, delegate: nil)
        let view = StoryboardScene.InitialSettings.initialScene.instantiate()
        view.viewModel = viewModel
        let router = InitialSettingsRouter(session: session, view: view)
        viewModel.router = router
        
        let pageManager: OnboardingPageManagerProtocol = OnboardingPageManager(session: session)
        view.pageManager = pageManager
        
        let rootVC = UINavigationController(rootViewController: view)
        AppDelegate.shared.window?.setRootViewController(rootVC, animated: animated, completion: nil)
    }
    
}
