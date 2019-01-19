//
//  SettingsThemeViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

protocol SettingsThemeViewModelType: ViewModelType {
    
    // MARK: Actions
    
    func itemSelected(at index: Int)
    
    // MARK: Callbacks
    
    var updateState: ((_ state: SettingsThemeViewState) -> Void)? { get set }
    
    // MARK: Properies
    
    var items: MutableProperty<[ThemeItemProtocol]> { get }
    var itemsCount: Property<Int> { get }
    
    // MARK: DataSources
    
    func item(for index: Int) -> ThemeItemProtocol?
    func isSelected(_ index: Int) -> Bool
    
}
