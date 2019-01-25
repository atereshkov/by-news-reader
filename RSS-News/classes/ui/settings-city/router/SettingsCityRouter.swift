//
//  SettingsCityRouter.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol SettingsCityRouterType: RouterType {
    func goBack(animated: Bool)
}

final class SettingsCityRouter: BaseRouter, SettingsCityRouterType {
    
    func goBack(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
    
}
