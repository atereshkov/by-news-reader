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
    
    //func initialize(_ viewsProvider: RoutesProviderProtocol)
    func viewInitialized()
    
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
    
    init(session: SessionType, provider: RoutesProviderProtocol) {
        self.session = session
        
        let providedViews = provider.getViews()
        views.append(contentsOf: providedViews)
    }
    
    /**
     Call it when the view that uses the Manager is initialied.
     It invokes the setupPages() method of OnboardingPageManagerDelegate
     */
    func viewInitialized() {
        delegate?.setupPages(views)
    }
    
    func viewBefore(_ viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = views.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return views.last }
        
        return views[previousIndex]
    }
    
    func viewAfter(_ viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = views.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = views.count
        guard orderedViewControllersCount != nextIndex else { return views.first }
        
        return views[nextIndex]
    }
    
}
