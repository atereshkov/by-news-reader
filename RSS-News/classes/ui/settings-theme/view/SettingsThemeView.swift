//
//  SettingsTheme.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class SettingsThemeView: BaseView<SettingsThemeViewModel> {
    
    @IBOutlet weak var themeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        themeSwitch.isOn = viewModel?.isSwitchOn ?? false
        
        themeSwitch.theme_tintColor = "SettingsTheme.Switch.TintColor"
        themeSwitch.theme_onTintColor = "SettingsTheme.Switch.OnTintColor"
        themeSwitch.theme_thumbTintColor = "SettingsTheme.Switch.ThumbColor"
    }
    
    @IBAction func themeSwitchValueChanged(_ sender: Any) {
        viewModel?.themeSwitchAction()
    }
    
}

private extension SettingsThemeView {
    
    func setupView() {
        title = L10n.SettingsTheme.title
    }
    
}
