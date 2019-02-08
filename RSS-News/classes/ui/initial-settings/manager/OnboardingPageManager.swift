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
    var session: SessionType { get }
    var views: [ViewType] { get }
    
    func initializeViews()
    
    func viewBefore(_ viewController: UIViewController) -> UIViewController?
    func viewAfter(_ viewController: UIViewController) -> UIViewController?
}

protocol OnboardingPageManagerDelegate: class {
    func setupPages(_ views: [ViewType])
}

class OnboardingPageManager: OnboardingPageManagerProtocol {
    
    weak var delegate: OnboardingPageManagerDelegate?
    
    private(set) var session: SessionType
    private(set) var views: [ViewType] = []
    
    init(session: SessionType) {
        self.session = session
    }
    
    func initializeViews() {        
        let page1 = OnboardingPageProviderTabRouter.initialize(session: session)
        let page2 = OnboardingPageThemeTabRouter.initialize(session: session)
        
        views.append(contentsOf: [page1, page2])
        delegate?.setupPages(views)
    }
    
    func viewBefore(_ viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = views.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return views.last }
        guard views.count > previousIndex else { return nil }
        
        return views[previousIndex]
    }
    
    func viewAfter(_ viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = views.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = views.count
        guard orderedViewControllersCount != nextIndex else { return views.first }
        guard orderedViewControllersCount > nextIndex else { return nil }
        
        return views[nextIndex]
    }
    
}
