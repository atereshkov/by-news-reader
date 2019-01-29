//
//  SettingsProviderViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class SettingsProviderViewModel: BaseViewModel<SettingsProviderRouter>, SettingsProviderViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((SettingsProviderViewState) -> Void)?
    var showAlert: ((_ title: String, _ msg: String, _ buttons: [UIAlertAction]) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[NewsProviderItemProtocol]> = MutableProperty([])
    
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    
    private let providerService: ProvidersServiceProtocol
    
    // MARK: Init
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.providerService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
        
        let providers = providerService
            .getProviderItems()
            .filter({ $0.enabled })
            .sorted(by: { $0.order ?? 0 < $1.order ?? 1 })
        items.value.append(contentsOf: providers)
        
        updateState?(.reloadItems)
    }
    
    // MARK: Actions
    
    func informationButtonAction() {
        let title = L10n.SettingsProvider.Information.Alert.title
        let msg = L10n.SettingsProvider.Information.Alert.message
        let ok = UIAlertAction(title: L10n.SettingsProvider.Information.Alert.Action.ok, style: .cancel, handler: nil)
        showAlert?(title, msg, [ok])
    }
    
    func itemSelected(at index: Int) {
        guard let item = item(for: index) else { return }
        guard let newProvider = AppProviderEnum(rawValue: item.name) else { return }
        
        providerService.changeProvider(to: newProvider)
        updateState?(.reloadItems)
        (delegate as? SettingsProviderViewDelegate)?.providerChanged(to: item)
    }
    
    func item(for index: Int) -> NewsProviderItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
    func isSelected(_ index: Int) -> Bool {
        guard let item = item(for: index) else { return false }
        return providerService.currentProvider.value.rawValue == item.name
    }
    
}

private extension SettingsProviderViewModel {
    
    func setup() {
        
    }
    
}
