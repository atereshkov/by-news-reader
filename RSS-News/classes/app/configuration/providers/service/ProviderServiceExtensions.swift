//
//  ProviderServiceExtensions.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

extension ProvidersServiceProtocol {
    
    func getProviderItems(_ plistName: String = ProvidersService.Constants.providerListFileName) -> [NewsProviderItemProtocol] {
        return getProviderItems(plistName)
    }
    
    func getProviderItem(_ provider: AppProviderEnum, plistName: String = ProvidersService.Constants.providerListFileName) -> NewsProviderItemProtocol? {
        return getProviderItem(provider, plistName: plistName)
    }
    
}
