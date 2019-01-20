//
//  ProvidersConfig.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol ProvidersServiceProtocol {
    func getProviderItems(_ plistName: String) -> [NewsProviderItemProtocol]
    func getProviderItem(_ provider: AppProviderEnum, plistName: String) -> NewsProviderItemProtocol?
}

extension ProvidersServiceProtocol {
    func getProviderItems(_ plistName: String = ProvidersService.Constants.providerListFileName) -> [NewsProviderItemProtocol] {
        return getProviderItems(plistName)
    }
    
    func getProviderItem(_ provider: AppProviderEnum, plistName: String = ProvidersService.Constants.providerListFileName) -> NewsProviderItemProtocol? {
        return getProviderItem(provider, plistName: plistName)
    }
}

final class ProvidersService: ProvidersServiceProtocol {
    
    struct Constants {
        static let providerListFileName = "Providers"
    }
    
    private let plistParserService: PlistParserServiceProtocol
    
    init(_ plistParserService: PlistParserServiceProtocol) {
        self.plistParserService = plistParserService
    }
    
    func getProviderItems(_ plistName: String = Constants.providerListFileName) -> [NewsProviderItemProtocol] {
        guard let path = Bundle.main.path(forResource: plistName, ofType: "plist") else { return [] }
        guard let json = NSDictionary(contentsOfFile: path) as? [String: Any] else { return [] }
        let items: [NewsProviderItemProtocol] = plistParserService.parseItems(from: json)
        return items
    }
    
    func getProviderItem(_ provider: AppProviderEnum, plistName: String) -> NewsProviderItemProtocol? {
        guard let path = Bundle.main.path(forResource: plistName, ofType: "plist") else { return nil }
        guard let json = NSDictionary(contentsOfFile: path) as? [String: Any] else { return nil }
        let item = plistParserService.parseItem(provider.rawValue, json: json)
        return item
    }
    
}
