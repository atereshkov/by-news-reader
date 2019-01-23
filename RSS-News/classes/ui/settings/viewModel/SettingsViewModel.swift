//
//  SettingsViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class SettingsViewModel: BaseViewModel<SettingsRouter>, SettingsViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((SettingsViewState) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[MenuListItemProtocol]> = MutableProperty([])
    
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
        
        fetchSettings()
    }
    
    // MARK: Actions
    
    func itemSelected(at index: Int) {
        guard let item = item(for: index) as? MenuListItem else { return }
        switch item.type {
        case .city:
            router?.goToSettingsCity()
        case .source:
            break
        case .about:
            break
        case .textSize:
            break
        case .theme:
            router?.goToSettingsTheme(delegate: self)
        }
    }
    
    func item(for index: Int) -> MenuListItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
    // MARK: Private
    
    private func fetchSettings() {
        let theme = AppSkin.currentTheme.localized
        let city = "Grodno"
        let source = "All"
        let fontSize = "Standard"
        
        items.value.removeAll()
        items.value.append(MenuListItem(title: L10n.Menu.Item.City.title, value: city, type: .city))
        items.value.append(MenuListItem(title: L10n.Menu.Item.Source.title, value: source, type: .source, showSeparator: false))
        items.value.append(MenuEmptyItem())
        items.value.append(MenuListItem(title: L10n.Menu.Item.FontSize.title, value: fontSize, type: .textSize))
        items.value.append(MenuListItem(title: L10n.Menu.Item.Theme.title, value: theme, type: .theme, showSeparator: false))
        items.value.append(MenuEmptyItem())
        items.value.append(MenuListItem(title: L10n.Menu.Item.About.title, value: nil, type: .about, showSeparator: true))
        
        updateState?(.reloadItems)
    }
    
}

private extension SettingsViewModel {
    
    func setup() {
        
    }
    
}

extension SettingsViewModel: SettingsThemeViewDelegate {
    
    func themeChanged(to: AppTheme) {
        fetchSettings()
    }
    
}
