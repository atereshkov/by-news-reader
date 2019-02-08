//
//  OnboardingPageDelegateCallback.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/9/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
@testable import RSS_News

class OnboardingPageDelegateMock {
    
    private(set) var views: [ViewType] = []
    
}

extension OnboardingPageDelegateMock: OnboardingPageManagerDelegate {
    
    func setupPages(_ views: [ViewType]) {
        self.views = views
    }
    
}
