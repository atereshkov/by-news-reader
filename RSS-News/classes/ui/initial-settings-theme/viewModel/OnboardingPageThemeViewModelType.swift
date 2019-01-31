//
//  OnboardingPageThemeViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol OnboardingPageThemeViewModelType: ViewModelType {
    
    // MARK: Actions
    
    func themeSwitchAction()
    
    // MARK: Properties
    
    var isSwitchOn: Bool { get }
    
}
