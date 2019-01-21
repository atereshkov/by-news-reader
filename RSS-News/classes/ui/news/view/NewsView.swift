//
//  NewsView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class NewsView: BaseView<NewsViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.topItem?.title = L10n.Feed.title
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
}

private extension NewsView {
    
    func setupView() {
        navigationItem.backBarButtonTitle = ""
    }
    
}
