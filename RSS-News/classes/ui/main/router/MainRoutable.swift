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
//        let viewModel = MainViewModel(session: session, delegate: nil)
//        let view = StoryboardScene.Main.initialScene.instantiate()
//        view.viewModel = viewModel
//        let router = MainRouter(session: session, view: view)
//        viewModel.router = router
//        
//        let rootVC = UINavigationController(rootViewController: view)
//        AppDelegate.shared.window?.setRootViewController(rootVC, animated: animated, completion: nil)
    }
}
