//
//  SettingsThemeViewDelegate.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/23/19.
//  Copyright © 2019 AT. All rights reserved.
//

protocol SettingsThemeViewDelegate: BaseViewDelegate {
    func themeChanged(to: AppTheme)
}
