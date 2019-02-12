//
//  PlistParserService.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol ProvidersParserProtocol {
    func parseItems() -> [NewsProviderItemProtocol]
    func parseItem(_ name: String) -> NewsProviderItemProtocol?
}

final class ProvidersParser: ProvidersParserProtocol {
    
    private let repository: ProvidersRepositoryProtocol
    
    init(_ repository: ProvidersRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: Public
    
    func parseItems() -> [NewsProviderItemProtocol] {
        var items: [NewsProviderItemProtocol] = []
        let json = repository.getProvidersJSON()
        for item in json {
            guard let providerItem = parse(item.key) else { continue }
            items.append(providerItem)
        }
        return items
    }
    
    func parseItem(_ name: String) -> NewsProviderItemProtocol? {
        let providerItem = parse(name)
        return providerItem
    }
    
    // MARK: Private
    
    private func parse(_ item: String) -> NewsProviderItemProtocol? {
        let json = repository.getProvidersJSON()
        guard let jsonItem = json[item] as? [String: Any] else { return nil }
        let categories: [NewsCategoryProtocol] = parseCategories(from: jsonItem)
        
        guard let generalJson = jsonItem["General"] as? [String: Any] else { return nil }
        guard let main = parseCategory("Main", from: generalJson) else { return nil }
        guard let latest = parseCategory("Latest", from: generalJson) else { return nil }
        let order = jsonItem["order"] as? Int
        let enabled = jsonItem["enabled"] as? Bool ?? false
        
        let providerItem = NewsProviderItem(name: item, categories: categories, main: main, latest: latest, order: order, enabled: enabled)
        return providerItem
    }
    
    private func parseCategories(from json: [String: Any]) -> [NewsCategoryProtocol] {
        var categories: [NewsCategoryProtocol] = []
        
        if let categoriesJson = json["Categories"] as? [String: Any] {
            for categoryJsonItem in categoriesJson {
                let catName = categoryJsonItem.key
                guard let categoryItem = parseCategory(catName, from: categoriesJson) else { continue }
                categories.append(categoryItem)
            }
        }
        
        return categories
    }
    
    private func parseCategory(_ name: String, from json: [String: Any]) -> NewsCategoryProtocol? {
        guard let categoryJson = json[name] as? [String: Any] else { return nil }
        guard let catUrl = categoryJson["url"] as? String else { return nil }
        let order = categoryJson["order"] as? Int
        let category: NewsCategoryProtocol = NewsCategory(name: name, url: catUrl, order: order)
        return category
    }
    
}
