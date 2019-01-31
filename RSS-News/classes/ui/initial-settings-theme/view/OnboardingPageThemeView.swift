//
//  OnboardingPageThemeView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

final class OnboardingPageThemeView: BaseView<OnboardingPageThemeViewModel> {
    
    @IBOutlet weak var themeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        themeSwitch.isOn = viewModel?.isSwitchOn ?? false
        
        themeSwitch.theme_tintColor = "Onboarding.Theme.Switch.TintColor"
        themeSwitch.theme_onTintColor = "Onboarding.Theme.Switch.OnTintColor"
        themeSwitch.theme_thumbTintColor = "Onboarding.Theme.Switch.ThumbColor"
    }
    
    @IBAction func themeSwitchValueChanged(_ sender: Any) {
        viewModel?.themeSwitchAction()
    }
    
}

private extension OnboardingPageThemeView {
    
    func setupView() {
        navigationItem.backBarButtonTitle = ""
    }
    
}
