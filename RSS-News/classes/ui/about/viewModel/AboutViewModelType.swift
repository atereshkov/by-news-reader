//
//  AboutViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/28/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

protocol AboutViewModelType: ViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((_ state: AboutViewState) -> Void)? { get set }
    
    // MARK: Properies
    
    var items: MutableProperty<[AboutListItemProtocol]> { get }
    var itemsCount: Property<Int> { get }
    
    // MARK: DataSources
    
    func item(for index: Int) -> AboutListItemProtocol?
    
}
