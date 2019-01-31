//
//  OnboardingPageProviderView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

final class OnboardingPageProviderView: BaseView<OnboardingPageProviderViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
}

private extension OnboardingPageProviderView {
    
    func setupView() {
        navigationItem.backBarButtonTitle = ""
    }
    
}
