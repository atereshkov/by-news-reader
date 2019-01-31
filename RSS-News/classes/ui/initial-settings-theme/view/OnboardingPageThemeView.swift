//
//  OnboardingPageThemeView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

final class OnboardingPageThemeView: BaseView<OnboardingPageThemeViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
}

private extension OnboardingPageThemeView {
    
    func setupView() {
        navigationItem.backBarButtonTitle = ""
    }
    
}
