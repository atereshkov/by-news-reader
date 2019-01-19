//
//  BookmarksView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class BookmarksView: BaseView<BookmarksViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
}

private extension BookmarksView {
    
    func setupView() {
        //        navigationItem.backBarButtonTitle = ""
        //        navigationController?.setupCustomBackButton()
    }
    
}
