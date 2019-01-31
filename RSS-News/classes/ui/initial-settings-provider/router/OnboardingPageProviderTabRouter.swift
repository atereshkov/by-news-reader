//
//  OnboardingPageProviderTabRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol OnboardingPageProviderTabRouterProtocol: class {
    static func initialize(session: SessionType) -> ViewType
}

class OnboardingPageProviderTabRouter: OnboardingPageProviderTabRouterProtocol {
    
    class func initialize(session: SessionType) -> UIViewController {
        let viewModel = OnboardingPageProviderViewModel(session: session, delegate: nil)
        let view = StoryboardScene.OnboardingPageProvider.initialScene.instantiate()
        view.viewModel = viewModel
        let router = OnboardingPageProviderRouter(session: session, view: view)
        viewModel.router = router
        return view
    }
    
}
