//
//  OnboardingRoutesProvider.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

class OnboardingRoutesProvider: RoutesProviderProtocol {
    
    private let session: SessionType
    
    init(session: SessionType) {
        self.session = session
    }
    
    func getViews() -> [ViewType] {
        let page1 = OnboardingPageProviderTabRouter.initialize(session: session)
        let page2 = OnboardingPageThemeTabRouter.initialize(session: session)
        
        return [page1, page2]
    }
    
}
