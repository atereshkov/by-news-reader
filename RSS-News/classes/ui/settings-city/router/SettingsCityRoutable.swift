//
//  SettingsCityRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol SettingsCityRoutable {
    func goToSettingsCity()
}

extension SettingsCityRoutable where Self: RouterType {
    
    func goToSettingsCity() {
        let viewModel = SettingsCityViewModel(session: session, delegate: nil)
        let view = StoryboardScene.SettingsCity.initialScene.instantiate()
        view.viewModel = viewModel
        let router = SettingsCityRouter(session: session, view: view)
        viewModel.router = router
        self.view?.navigationController?.pushViewController(view, animated: true)
    }
    
}
