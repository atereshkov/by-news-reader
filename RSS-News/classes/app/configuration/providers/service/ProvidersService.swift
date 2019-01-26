//
//  ProvidersConfig.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol ProvidersServiceDelegate: class {
    func providerChanged(to provider: AppProviderEnum)
}

final class ProvidersService: ProvidersServiceProtocol {
    
    struct Constants {
        static let defaulProvider: AppProviderEnum = .tutBy
        static let providerListFileName = "Providers"
    }
    
    weak var delegate: ProvidersServiceDelegate?
    
    private let plistParserService: PlistParserServiceProtocol
    
    init(_ plistParserService: PlistParserServiceProtocol) {
        self.plistParserService = plistParserService
    }
    
    // MARK: Provider DataSources
    
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
    
    func getCurrentProviderItem() -> NewsProviderItemProtocol? {
        return getProviderItem(currentProvider)
    }
    
    // MARK: Interaction
    
    var currentProvider: AppProviderEnum {
        let userProvider = PreferenceService.shared.provider
        let provider = AppProviderEnum.init(rawValue: userProvider) ?? Constants.defaulProvider
        return provider
    }
    
    func changeProvider(to provider: AppProviderEnum) {
        PreferenceService.shared.provider = provider.rawValue
        delegate?.providerChanged(to: provider)
    }
    
}
