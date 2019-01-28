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
    func previewPopAction(view: ViewType)
    func pullToRefreshAction()
    
    // MARK: Callbacks
    
    var updateState: ((_ state: CategoryNewsViewState) -> Void)? { get set }
    
    // MARK: Properies
    
    var items: MutableProperty<[NewsItemProtocol]> { get }
    var itemsCount: Property<Int> { get }
    
    // MARK: DataSources
    
    var isLoading: Property<Bool> { get }
    var isInternetReachable: MutableProperty<Bool> { get }
    var noInternetViewIsHidden: Property<Bool> { get }
    var tableViewIsHidden: Property<Bool> { get }
    var screenTitle: Property<String> { get }
    
    func detailView(for index: Int) -> ViewType?
    func item(for index: Int) -> NewsItemProtocol?
    func isBookmarked(_ index: Int) -> Bool
    
}
