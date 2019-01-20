//
//  CategoriesViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol CategoriesViewModelType: ViewModelType {
    
    // MARK: Actions
    
    func itemSelected(at index: Int)
    
    // MARK: Callbacks
    
    var updateState: ((_ state: CategoriesViewState) -> Void)? { get set }
    
    // MARK: Properies
    
    var items: MutableProperty<[NewsCategoryProtocol]> { get }
    var itemsCount: Property<Int> { get }
    
    // MARK: DataSources
    
    func item(for index: Int) -> NewsCategoryProtocol?
    
}
