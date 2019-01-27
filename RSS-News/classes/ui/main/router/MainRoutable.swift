//
//  MainRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol MainRoutable {
    func goToMain(animated: Bool)
}

extension MainRoutable where Self: RouterType {
    
    func goToMain(animated: Bool = false) {
        let viewModel = MainViewModel(session: session, delegate: nil)
        let view = self.targetView
        view.viewModel = viewModel
        let router = MainRouter(session: session, view: view)
        viewModel.router = router
        
        let homeTabBar: HomeTabBarProtocol = HomeTabBarManager(session: session)
        view.tabBar = homeTabBar

        let rootVC = UINavigationController(rootViewController: view)
        AppDelegate.shared.window?.setRootViewController(rootVC, animated: animated, completion: nil)
    }
    
    private var targetView: MainView {
        if UIDevice.isPad {
            return StoryboardScene.MainIPad.initialScene.instantiate()
        } else {
            return StoryboardScene.Main.initialScene.instantiate()
        }
    }
    
}
