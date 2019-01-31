//
//  InitialSettingsView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import FeedKit
import SwiftTheme

final class InitialSettingsView: UIPageViewController {
    
    var pageManager: OnboardingPageManagerProtocol?
    var viewModel: InitialSettingsViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
            scrollToViewController(viewController: nextViewController)
        }
    }
    
    func scrollToViewController(index newIndex: Int) {
        guard let pageManager = pageManager else { return }
        if let firstViewController = viewControllers?.first,
            let currentIndex = pageManager.views.firstIndex(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = pageManager.views[newIndex]
            scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController], direction: direction, animated: true, completion: { [weak self] (_) in
            self?.notifyTutorialDelegateOfNewIndex()
        })
    }
    
    private func notifyTutorialDelegateOfNewIndex() {
        guard let pageManager = pageManager else { return }
        if let firstViewController = viewControllers?.first, let index = pageManager.views.firstIndex(of: firstViewController) {
            //tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageIndex: index)
        }
    }
    
}

private extension InitialSettingsView {
    
    func setupView() {
        dataSource = self
        delegate = self
        
        let title = L10n.InitialSettings.NavBar.skip
        let button: UIBarButtonItem = .rightTextBtn(title: title) { [weak self] in
            self?.viewModel?.skipAction()
        }
        navigationItem.rightBarButtonItem = button
        
        pageManager?.delegate = self
        pageManager?.initialize()
    }
    
}

extension InitialSettingsView: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pageManager?.views.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else { return pageManager?.views.last }
        
        guard pageManager?.views.count ?? 0 > previousIndex else { return nil }
        
        return pageManager?.views[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pageManager?.views.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = pageManager?.views.count ?? 0
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else { return pageManager?.views.first }
        
        guard orderedViewControllersCount > nextIndex else { return nil }
        
        return pageManager?.views[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageManager?.views.count ?? 0
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = pageManager?.views.firstIndex(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
}

extension InitialSettingsView: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        notifyTutorialDelegateOfNewIndex()
    }
    
}

extension InitialSettingsView: OnboardingPageManagerDelegate {
    
    func setupPages(_ views: [ViewType]) {
        if let initialViewController = views.first {
            scrollToViewController(viewController: initialViewController)
        }
    }
    
}
