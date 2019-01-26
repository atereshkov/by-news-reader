//
//  InitialSettingsView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import FeedKit
import SwiftTheme

final class InitialSettingsView: BaseView<InitialSettingsViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
}

private extension InitialSettingsView {
    
    func setupView() {
        let title = L10n.InitialSettings.NavBar.skip
        let button: UIBarButtonItem = .rightTextBtn(title: title) { [weak self] in
            self?.viewModel?.skipAction()
        }
        navigationItem.rightBarButtonItem = button
    }
    
}
