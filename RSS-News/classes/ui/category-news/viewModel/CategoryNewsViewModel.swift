//
//  CategoryNewsViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift

final class CategoryNewsViewModel: BaseViewModel<CategoryNewsRouter>, CategoryNewsViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((CategoryNewsViewState) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[CategoryNewsItemProtocol]> = MutableProperty([])
    
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    
    private let item: NewsCategoryProtocol?
    
    // MARK: Init
    
    init(item: NewsCategoryProtocol, session: SessionType, delegate: BaseViewDelegate?) {
        self.item = item
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
        
        updateState?(.reloadItems)
    }
    
    // MARK: Actions
    
    func itemSelected(at index: Int) {
        
    }
    
    // MARK: DataSource
    
    func item(for index: Int) -> CategoryNewsItemProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
}

private extension CategoryNewsViewModel {
    
    func setup() {
        
    }
    
}
