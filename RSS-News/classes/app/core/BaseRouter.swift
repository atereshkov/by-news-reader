//
//  BaseRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import Foundation

protocol RouterType: class {
    var view: ViewType? { get }
    var session: SessionType { get }
}

class BaseRouter: RouterType {
    
    let session: SessionType
    private(set) weak var view: ViewType?
    
    init(session: SessionType, view: ViewType) {
        self.session = session
        self.view = view
    }
    
}

extension RouterType {
    
    var navigationController: UINavigationController? {
        let nc = view?.navigationController ?? view as? UINavigationController
        return nc
    }
    
}
