//
//  AppProviderEnum.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

enum AppProviderEnum: String {
    // rawValue should be uniq and the same as in Providers.plist
    
    case tutBy = "TUT.by"
    case onlinerBy = "Onliner.by"
    
    var localized: String {
        return self.rawValue.localized
    }
}
