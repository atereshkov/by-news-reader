//
//  SettingsProviderRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol SettingsProviderRoutable {
    func goToSettingsProvider(delegate: SettingsProviderViewDelegate?)
}

extension SettingsProviderRoutable where Self: RouterType {
    
    func goToSettingsProvider(delegate: SettingsProviderViewDelegate?) {
        let viewModel = SettingsProviderViewModel(session: session, delegate: delegate)
        let view = StoryboardScene.SettingsProvider.initialScene.instantiate()
        view.viewModel = viewModel
        let router = SettingsProviderRouter(session: session, view: view)
        viewModel.router = router
        self.view?.navigationController?.pushViewController(view, animated: true)
    }
    
}
