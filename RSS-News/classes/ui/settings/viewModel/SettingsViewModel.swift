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
        
        items.value.append(MenuListItem(title: "Test 1", value: "Test Value", type: .city))
        items.value.append(MenuListItem(title: "Test 2", value: "Test Value", type: .source, showSeparator: false))
        items.value.append(MenuEmptyItem())
        items.value.append(MenuListItem(title: "Test 3", value: "Test Value", type: .textSize))
        items.value.append(MenuListItem(title: "Test 4", value: "Test Value", type: .theme, showSeparator: true))
        
        updateState?(.reloadItems)
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
            router?.goToSettingsTheme()
        }
    }
    
    func item(for index: Int) -> MenuListItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
}

private extension SettingsViewModel {
    
    func setup() {
        
    }
    
}
