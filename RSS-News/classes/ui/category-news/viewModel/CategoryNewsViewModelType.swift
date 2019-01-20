//
//  CategoryNewsViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol CategoryNewsViewModelType: ViewModelType {
    
    // MARK: Actions
    
    func itemSelected(at index: Int)
    
    // MARK: Callbacks
    
    var updateState: ((_ state: CategoryNewsViewState) -> Void)? { get set }
    
    // MARK: Properies
    
    var items: MutableProperty<[CategoryNewsItemProtocol]> { get }
    var itemsCount: Property<Int> { get }
    
    // MARK: DataSources
    
    func item(for index: Int) -> CategoryNewsItemProtocol?
    
}
