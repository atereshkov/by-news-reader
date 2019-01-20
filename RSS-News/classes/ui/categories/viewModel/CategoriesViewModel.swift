//
//  CategoriesViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift

final class CategoriesViewModel: BaseViewModel<CategoriesRouter>, CategoriesViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((CategoriesViewState) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[NewsCategoryProtocol]> = MutableProperty([])
    
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
        
        let provider = AppProvider.currentProvider
        let providerItem = providerService.getProviderItem(provider)
        if let categories = providerItem?.categories {
             items.value.append(contentsOf: categories)
        }
        
        updateState?(.reloadItems)
    }
    
    // MARK: Actions
    
    func itemSelected(at index: Int) {
        
    }
    
    // MARK: DataSource
    
    func item(for index: Int) -> NewsCategoryProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
}

private extension CategoriesViewModel {
    
    func setup() {
        
    }
    
}
