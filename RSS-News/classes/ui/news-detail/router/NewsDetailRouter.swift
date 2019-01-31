//
//  NewsDetailRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/21/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

protocol NewsDetailRouterType: RouterType, ShareRoutable {
    func openLink(_ url: String)
}

final class NewsDetailRouter: BaseRouter, NewsDetailRouterType {
    
    func openLink(_ url: String) {
        guard let url = URL(string: url), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
    
}
