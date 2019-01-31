//
//  OnboardingPageManager.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

protocol OnboardingPageManagerProtocol: class {
    var delegate: OnboardingPageManagerDelegate? { get set }
    var views: [ViewType] { get }
    
    func initialize()
}

protocol OnboardingPageManagerDelegate: class {
    func setupPages(_ views: [ViewType])
}

class OnboardingPageManager: OnboardingPageManagerProtocol {
    
    weak var delegate: OnboardingPageManagerDelegate?
    private var session: SessionType?
    
    private(set) var views: [ViewType] = []
    
    init(session: SessionType) {
        self.session = session
    }
    
    func initialize() {
        guard let session = session else { return }
        
        let page1 = OnboardingPageProviderTabRouter.initialize(session: session)
        let page2 = OnboardingPageThemeTabRouter.initialize(session: session)
        
        views.append(contentsOf: [page1, page2])
        delegate?.setupPages(views)
    }
    
}
