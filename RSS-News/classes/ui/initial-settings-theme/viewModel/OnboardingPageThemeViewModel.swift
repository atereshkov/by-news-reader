//
//  OnboardingPageThemeViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

final class OnboardingPageThemeViewModel: BaseViewModel<OnboardingPageThemeRouter>, OnboardingPageThemeViewModelType {
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        super.init(session: session, delegate: delegate)
    }
    
    // MARK: Properties
    
    var isSwitchOn: Bool {
        return AppSkin.currentTheme == .dark
    }
    
    // MARK: Actions
    
    func themeSwitchAction() {
        let currentTheme = AppSkin.currentTheme
        let newTheme: AppTheme = currentTheme == .dark ? .white : .dark
        AppSkin.setTheme(newTheme)
    }
    
}

private extension OnboardingPageThemeViewModel {
    
    func setup() {
        
    }
    
}
