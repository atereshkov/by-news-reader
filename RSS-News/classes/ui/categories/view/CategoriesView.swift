//
//  CategoriesView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class CategoriesView: BaseView<CategoriesViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
}

private extension CategoriesView {
    
    func setupView() {
        navigationItem.backBarButtonTitle = ""
    }
    
}
