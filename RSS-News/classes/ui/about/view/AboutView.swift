//
//  AboutView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/28/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class AboutView: BaseView<AboutViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
}

private extension AboutView {
    
    func setupView() {
        title = L10n.About.title
    }
    
}
