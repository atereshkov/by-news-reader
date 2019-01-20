//
//  CategoryNewsRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol CategoryNewsRoutable {
    func goToCategoryNews(item: NewsCategoryProtocol)
}

extension CategoryNewsRoutable where Self: RouterType {
    
    func goToCategoryNews(item: NewsCategoryProtocol) {
        let viewModel = CategoryNewsViewModel(item: item, session: session, delegate: nil)
        let view = StoryboardScene.CategoryNews.initialScene.instantiate()
        view.viewModel = viewModel
        let router = CategoryNewsRouter(session: session, view: view)
        viewModel.router = router
        self.view?.navigationController?.pushViewController(view, animated: true)
    }
    
}
