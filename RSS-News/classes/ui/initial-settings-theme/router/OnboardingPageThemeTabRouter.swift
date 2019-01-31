//
//  OnboardingPageThemeTabRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol OnboardingPageThemeTabRouterProtocol: class {
    static func initialize(session: SessionType) -> ViewType
}

class OnboardingPageThemeTabRouter: OnboardingPageThemeTabRouterProtocol {
    
    class func initialize(session: SessionType) -> ViewType {
        let viewModel = OnboardingPageThemeViewModel(session: session, delegate: nil)
        let view = StoryboardScene.OnboardingPageTheme.initialScene.instantiate()
        view.viewModel = viewModel
        let router = OnboardingPageThemeRouter(session: session, view: view)
        viewModel.router = router
        return view
    }
    
}
