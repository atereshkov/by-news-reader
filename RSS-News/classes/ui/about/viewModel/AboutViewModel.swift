//
//  AboutViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/28/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class AboutViewModel: BaseViewModel<AboutRouter>, AboutViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((AboutViewState) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[AboutListItemProtocol]> = MutableProperty([])
    
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
        
        items.value.append(AboutTitleItem(title: L10n.About.Information.About.title))
        items.value.append(AboutListItem(text: L10n.About.Information.About.text, showSeparator: false))
        items.value.append(AboutTitleItem(title: L10n.About.Information.CopyrightInfo.title))
        items.value.append(AboutListItem(text: L10n.About.Information.CopyrightInfo.text, showSeparator: false))
        items.value.append(AboutTitleItem(title: L10n.About.Information.Developer.title))
        items.value.append(AboutListItem(text: L10n.About.Information.Developer.text, showSeparator: false))
        
        updateState?(.reloadItems)
    }
    
    func item(for index: Int) -> AboutListItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
}

private extension AboutViewModel {
    
    func setup() {
        
    }
    
}
