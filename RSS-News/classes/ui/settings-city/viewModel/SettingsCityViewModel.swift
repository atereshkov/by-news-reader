//
//  SettingsCityViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class SettingsCityViewModel: BaseViewModel<SettingsCityRouter>, SettingsCityViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((SettingsCityViewState) -> Void)?
    var showAlert: ((String, String, [UIAlertAction]) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[RegionItemProtocol]> = MutableProperty([])
    
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
        
        let stab: RegionItemProtocol = RegionItem(id: "stab", name: "Вся Беларусь")
        items.value.append(stab)
        
        updateState?(.reloadItems)
    }
    
    // MARK: Actions
    
    func informationButtonAction() {
        let title = L10n.SettingsCity.Information.Alert.title
        let msg = L10n.SettingsCity.Information.Alert.message
        let ok = UIAlertAction(title: L10n.SettingsCity.Information.Alert.Action.ok, style: .cancel, handler: nil)
        showAlert?(title, msg, [ok])
    }
    
    func itemSelected(at index: Int) {
        guard let item = item(for: index) else { return }
        updateState?(.reloadItems)
        (delegate as? SettingsCityViewDelegate)?.regionChanged(to: item)
        router?.goBack(animated: true)
    }
    
    func item(for index: Int) -> RegionItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
    func isSelected(_ index: Int) -> Bool {
        //guard let item = item(for: index) else { return false }
        return true
    }
    
}

private extension SettingsCityViewModel {
    
    func setup() {
        
    }
    
}
