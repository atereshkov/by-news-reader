//
//  OnboardingPageProviderViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class OnboardingPageProviderViewModel: BaseViewModel<OnboardingPageProviderRouter>, OnboardingPageProviderViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((OnboardingProviderViewState) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[NewsProviderItemProtocol]> = MutableProperty([])
    
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    
    private let providerService: ProvidersServiceProtocol
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.providerService = session.resolve()
        super.init(session: session, delegate: delegate)
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
    
    func itemSelected(at index: Int) {
        guard let item = item(for: index) else { return }
        guard let newProvider = AppProviderEnum(rawValue: item.name) else { return }
        
        providerService.changeProvider(to: newProvider)
        updateState?(.reloadItems)
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

private extension OnboardingPageProviderViewModel {
    
    func setup() {
        
    }
    
}
