//
//  SettingsViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol SettingsViewModelType: ViewModelType {
    
}

final class SettingsViewModel: BaseViewModel<SettingsRouter>, SettingsViewModelType {
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
}

private extension SettingsViewModel {
    
    func setup() {
        
    }
    
}