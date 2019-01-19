//
//  SettingsThemeRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol SettingsThemeRoutable {
    func goToSettingsTheme()
}

extension SettingsThemeRoutable where Self: RouterType {
    
    func goToSettingsTheme() {
        let viewModel = SettingsThemeViewModel(session: session, delegate: nil)
        let view = StoryboardScene.SettingsTheme.initialScene.instantiate()
        view.viewModel = viewModel
        let router = SettingsThemeRouter(session: session, view: view)
        viewModel.router = router
        self.view?.navigationController?.pushViewController(view, animated: true)
    }
    
}
