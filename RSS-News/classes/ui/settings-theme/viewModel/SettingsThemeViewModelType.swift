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
    
    func themeSwitchAction()
    
    // MARK: Properties
    
    var isSwitchOn: Bool { get }
    
}
