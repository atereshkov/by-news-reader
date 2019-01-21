//
//  SettingsThemeViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class SettingsThemeViewModel: BaseViewModel<SettingsThemeRouter>, SettingsThemeViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((SettingsThemeViewState) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[ThemeItemProtocol]> = MutableProperty([])
    
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    
    // MARK: Init
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
        
        let theme1 = ThemeItem(id: AppTheme.dark.rawValue, title: AppTheme.dark.localized)
        let theme2 = ThemeItem(id: AppTheme.white.rawValue, title: AppTheme.white.localized)
        let theme3 = ThemeItem(id: AppTheme.paper.rawValue, title: AppTheme.paper.localized)
        items.value.append(contentsOf: [theme1, theme2, theme3])
        
        updateState?(.reloadItems)
    }
    
    // MARK: Actions
    
    func itemSelected(at index: Int) {
        guard let item = item(for: index) else { return }
        guard let newTheme = AppTheme(rawValue: item.id) else { return }
        
        AppSkin.setTheme(newTheme)
        updateState?(.reloadItems)
    }
    
    func item(for index: Int) -> ThemeItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
    func isSelected(_ index: Int) -> Bool {
        guard let item = item(for: index) else { return false }
        return AppSkin.currentTheme.localized == item.title
    }
    
}

private extension SettingsThemeViewModel {
    
    func setup() {
        
    }
    
}
