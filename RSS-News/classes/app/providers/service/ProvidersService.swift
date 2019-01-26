//
//  ProvidersConfig.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class ProvidersService: ProvidersServiceProtocol {
    
    struct Constants {
        static let defaulProvider: AppProviderEnum = .tutBy
        static let providerListFileName = "Providers"
    }
    
    private var provider: MutableProperty<AppProviderEnum> = MutableProperty(Constants.defaulProvider)
    
    private let plistParserService: PlistParserServiceProtocol
    
    init(_ plistParserService: PlistParserServiceProtocol) {
        self.plistParserService = plistParserService
    }
    
    // MARK: Provider DataSources
    
    var currentProvider: Property<AppProviderEnum> {
        return Property(provider)
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
    
    func getCurrentProviderItem() -> NewsProviderItemProtocol? {
        return getProviderItem(currentProvider.value)
    }
    
    // MARK: Interaction
    
    func changeProvider(to provider: AppProviderEnum) {
        PreferenceService.shared.provider = provider.rawValue
        self.provider.value = provider
    }
    
}
