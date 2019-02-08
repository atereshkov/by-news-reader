//
//  InitialSettingsViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

final class InitialSettingsViewModel: BaseViewModel<InitialSettingsRouter>, InitialSettingsViewModelType {
    
    private var preferenceService: AppPreferenceServiceProtocol
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.preferenceService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    func skipAction() {
        preferenceService.initialSetupPassed = true
        router?.goToMain(animated: false)
    }
    
}

private extension InitialSettingsViewModel {
    
    func setup() {
        
    }
    
}
