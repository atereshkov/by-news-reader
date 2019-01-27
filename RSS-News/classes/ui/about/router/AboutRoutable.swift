//
//  AboutRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/28/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol AboutRoutable {
    func goToAbout()
}

extension AboutRoutable where Self: RouterType {
    
    func goToAbout() {
        let viewModel = AboutViewModel(session: session, delegate: nil)
        let view = StoryboardScene.About.initialScene.instantiate()
        view.viewModel = viewModel
        let router = AboutRouter(session: session, view: view)
        viewModel.router = router
        self.view?.navigationController?.pushViewController(view, animated: true)
    }
    
}
