//
//  SettingsThemeViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class SettingsThemeViewModel: BaseViewModel<SettingsThemeRouter>, SettingsThemeViewModelType {
    
    private var appThemeService: AppThemeServiceProtocol
    
    // MARK: Init
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.appThemeService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
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
        (delegate as? SettingsThemeViewDelegate)?.themeChanged(to: newTheme)
    }
    
}

private extension SettingsThemeViewModel {
    
    func setup() {
        
    }
    
}
