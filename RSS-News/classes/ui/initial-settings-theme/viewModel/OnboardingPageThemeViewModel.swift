//
//  OnboardingPageThemeViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

final class OnboardingPageThemeViewModel: BaseViewModel<OnboardingPageThemeRouter>, OnboardingPageThemeViewModelType {
    
    private var appThemeService: AppThemeServiceProtocol
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.appThemeService = session.resolve()
        super.init(session: session, delegate: delegate)
    }
    
    // MARK: Properties
    
    var isSwitchOn: Bool {
        return appThemeService.currentTheme == .dark
    }
    
    // MARK: Actions
    
    func themeSwitchAction() {
        let currentTheme = appThemeService.currentTheme
        let newTheme: AppTheme = currentTheme == .dark ? .white : .dark
        appThemeService.setTheme(newTheme)
    }
    
}

private extension OnboardingPageThemeViewModel {
    
    func setup() {
        
    }
    
}
