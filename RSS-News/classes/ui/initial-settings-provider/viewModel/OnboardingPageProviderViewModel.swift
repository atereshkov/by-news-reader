//
//  OnboardingPageProviderViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

final class OnboardingPageProviderViewModel: BaseViewModel<OnboardingPageProviderRouter>, OnboardingPageProviderViewModelType {
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        super.init(session: session, delegate: delegate)
    }
    
}

private extension OnboardingPageProviderViewModel {
    
    func setup() {
        
    }
    
}
