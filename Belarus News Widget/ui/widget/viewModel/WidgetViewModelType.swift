//
//  WidgetViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 2/4/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import NotificationCenter

protocol WidgetViewModelType: ViewModelType {
    
    // MARK: Actions
    
    func itemSelected(at index: Int, context: NSExtensionContext?)
    
    //func fetchNewDataAction(completion: @escaping ((RSSFeed?, Error?) -> Void))
    func fetchNewDataAction(completionHandler: (@escaping (NCUpdateResult) -> Void))
    
    // MARK: Callbacks
    
    var updateState: ((_ state: WidgetViewState) -> Void)? { get set }
    
    // MARK: Properies
    
    var items: MutableProperty<[NewsItemProtocol]> { get }
    var itemsCount: Property<Int> { get }
    
    // MARK: DataSources
    
    var isLoading: Property<Bool> { get }
    
    func item(for index: Int) -> NewsItemProtocol?
    
}
