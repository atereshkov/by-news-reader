//
//  AppRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol AppRouterProtocol {
    func start()
    
    var rootViewController: UIViewController? { get }
}

final class AppRouter: AppRouterProtocol {
    
    private(set) var window: UIWindow
    private(set) var session: SessionType?
    
    init(window: UIWindow, session: SessionType) {
        self.window = window
        self.session = session
    }
    
    var rootViewController: UIViewController? {
        return window.rootViewController
    }
    
    func start() {
        guard let preferenceService: AppPreferenceServiceProtocol = session?.resolve() else {
            goToInitialSettings(animated: false)
            return
        }
        
        if preferenceService.initialSetupPassed {
            goToMain(animated: false)
        } else {
            goToInitialSettings(animated: false)
        }
    }
    
    // Use MainRouable instead if accessing from ViewModel router
    private func goToMain(animated: Bool) {
        guard let session = session else { return }
        let vc = UIViewController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        
        let router = InitialMainRouter(session: session, view: vc)
        router.goToMain(animated: animated)
    }
    
    // Use InitialSettingsRoutable instead if accessing from ViewModel router
    private func goToInitialSettings(animated: Bool) {
        guard let session = session else { return }
        let vc = UIViewController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        
        let router = StartInitialSettingsRouter(session: session, view: vc)
        router.goToInitialSettings(animated: animated)
    }
    
}
