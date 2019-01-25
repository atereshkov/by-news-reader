//
//  SettingsCityViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

protocol SettingsCityViewModelType: ViewModelType {
    
    // MARK: Actions
    
    func informationButtonAction()
    func itemSelected(at index: Int)
    
    // MARK: Callbacks
    
    var updateState: ((_ state: SettingsCityViewState) -> Void)? { get set }
    
    // MARK: Properies
    
    var items: MutableProperty<[RegionItemProtocol]> { get }
    var itemsCount: Property<Int> { get }
    
    // MARK: DataSources
    
    func item(for index: Int) -> RegionItemProtocol?
    func isSelected(_ index: Int) -> Bool
    
}
