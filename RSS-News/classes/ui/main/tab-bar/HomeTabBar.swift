//
//  File.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

protocol HomeTabBarProtocol: class {
    var delegate: HomeTabBarDelegate? { get set }
    var items: [TabBarItemProtocol] { get set }
    var selectedIndex: Int { get set }
    var defaultTab: Int { get set }
    
    func initialize()
    func selectTab(index: Int)
    func getButtons() -> [UIControl]
    func getViews() -> [ViewType]
}

protocol HomeTabBarDelegate: class {
    func setupTabBar(_ items: [TabBarItemProtocol])
    func controllerSwitched(to: TabBarItemProtocol, from: TabBarItemProtocol)
}

class HomeTabBarManager: HomeTabBarProtocol {
    
    weak var delegate: HomeTabBarDelegate?
    private var session: SessionType?
    
    internal var items: [TabBarItemProtocol] = []
    internal var selectedIndex: Int = 0
    internal var defaultTab: Int = 0
    
    init(session: SessionType) {
        self.session = session
    }
    
    func initialize() {
        let buttons = getButtons()
        let controllers = getViews()
        guard buttons.count == controllers.count else { return }
        var items: [TabBarItemProtocol] = []
        
        for index in 0..<buttons.count {
            let vc = controllers[index]
            let button = buttons[index]
            let item: TabBarItemProtocol = HomeTabBarItem(view: vc, button: button)
            items.append(item)
        }
        
        self.items = items
        self.delegate?.setupTabBar(items)
        self.selectTab(index: defaultTab)
    }
    
    func selectTab(index: Int) {
        guard index >= 0 && index < items.count else { return }
        let buttons = items.map({ $0.button })
        buttonAction(buttons[index])
    }
    
    func getButtons() -> [UIControl] {
        var buttons: [UIControl] = []
        let btn1 = TabBarButton(frame: .zero)
        btn1.image = Asset.Images.tab.image
        btn1.text = L10n.Main.TabBar.Tab1.title
        btn1.sizeToFit()
        buttons.append(btn1)
        let btn2 = TabBarButton(frame: .zero)
        btn2.image = Asset.Images.tab.image
        btn2.text = L10n.Main.TabBar.Tab2.title
        btn2.sizeToFit()
        buttons.append(btn2)
        let btn3 = TabBarButton(frame: .zero)
        btn3.image = Asset.Images.tab.image
        btn3.text = L10n.Main.TabBar.Tab3.title
        btn3.sizeToFit()
        buttons.append(btn3)
        let btn4 = TabBarButton(frame: .zero)
        btn4.image = Asset.Images.tab.image
        btn4.text = L10n.Main.TabBar.Tab4.title
        btn4.sizeToFit()
        buttons.append(btn4)
        
        for index in 0..<buttons.count {
            buttons[index].tag = index
            buttons[index].addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            buttons[index].theme_tintColor = "TabBar.ItemColorDefault"
        }
        
        return buttons
    }
    
    func getViews() -> [ViewType] {
        guard let session = session else { return [] }
        let newsView = NewsTabRouter.initializeNewsModule(session: session)
        let categoriesView = BookmarksTabRouter.initializeBookmarksModule(session: session)
        let bookmarksView = BookmarksTabRouter.initializeBookmarksModule(session: session)
        let settingsView = BookmarksTabRouter.initializeBookmarksModule(session: session)
        return [newsView, categoriesView, bookmarksView, settingsView]
    }
    
    @objc private func buttonAction(_ sender: UIControl) {
        let buttons = items.map({ $0.button })
        let previousIndex = self.selectedIndex
        self.selectedIndex = sender.tag
        
        buttons[previousIndex].theme_tintColor = "TabBar.ItemColorDefault"
        sender.theme_tintColor = "TabBar.ItemColorSelected"
        
        let previousVC = items[previousIndex]
        let selectedVC = items[selectedIndex]
        delegate?.controllerSwitched(to: selectedVC, from: previousVC)
    }
    
}
