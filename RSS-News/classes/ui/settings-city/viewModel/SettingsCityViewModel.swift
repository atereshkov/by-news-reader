//
//  SettingsCityViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class SettingsCityViewModel: BaseViewModel<SettingsCityRouter>, SettingsCityViewModelType {
    
    // MARK: Init
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
    }
    
    // MARK: Actions
    
    func informationButtonAction() {
        
    }
    
}

private extension SettingsCityViewModel {
    
    func setup() {
        
    }
    
}
