//
//  NewsDetailRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/21/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

protocol NewsDetailRoutable {
    func goToNewsDetail(item: NewsItemProtocol, delegate: NewsDetailViewDelegate?)
}

extension NewsDetailRoutable where Self: RouterType {
    
    func goToNewsDetail(item: NewsItemProtocol, delegate: NewsDetailViewDelegate?) {
        let viewModel = NewsDetailViewModel(session: session, delegate: delegate, item: item)
        let view = StoryboardScene.NewsDetail.initialScene.instantiate()
        view.viewModel = viewModel
        let router = NewsDetailRouter(session: session, view: view)
        viewModel.router = router
        self.view?.navigationController?.pushViewController(view, animated: true)
    }
    
}
