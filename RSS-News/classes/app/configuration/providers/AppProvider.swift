//
//  AppProvider.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

struct AppProvider {
    
    struct Constants {
        static let defaulProvider: AppProviderEnum = .tutBy
    }
    
    static var currentProvider: AppProviderEnum {
        let userProvider = PreferenceService.shared.provider
        let provider = AppProviderEnum.init(rawValue: userProvider) ?? Constants.defaulProvider
        return provider
    }
    
    static func changeProvider(to provider: AppProviderEnum) {
        PreferenceService.shared.provider = provider.rawValue
    }
    
}
