//
//  BookmarksViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

protocol BookmarksViewModelType: ViewModelType {
    
    // MARK: Actions
    
    func viewWillAppear()
    
    func itemSelected(at index: Int)
    func previewPopAction(view: ViewType)
    
    // MARK: Callbacks
    
    var updateState: ((_ state: BookmarksViewState) -> Void)? { get set }
    
    // MARK: Properies
    
    var items: MutableProperty<[NewsItemProtocol]> { get }
    var itemsCount: Property<Int> { get }
    
    // MARK: DataSources
    
    var isEmpty: Property<Bool> { get }
    
    func detailView(for index: Int) -> ViewType?
    func item(for index: Int) -> NewsItemProtocol?
    func isBookmarked(_ index: Int) -> Bool
    
}
