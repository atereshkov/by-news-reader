//
//  PlistParserService.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol PlistParserServiceProtocol {
    func parseItems(from json: [String: Any]) -> [NewsProviderItemProtocol]
    func parseItem(_ name: String, json: [String: Any]) -> NewsProviderItemProtocol?
}

final class PlistParserService: PlistParserServiceProtocol {
    
    // MARK: Public
    
    func parseItems(from json: [String : Any]) -> [NewsProviderItemProtocol] {
        var items: [NewsProviderItemProtocol] = []
        for item in json {
            guard let providerItem = parse(item.key, from: json) else { continue }
            items.append(providerItem)
        }
        return items
    }
    
    func parseItem(_ name: String, json: [String : Any]) -> NewsProviderItemProtocol? {
        let providerItem = parse(name, from: json)
        return providerItem
    }
    
    // MARK: Private
    
    private func parse(_ item: String, from json: [String: Any]) -> NewsProviderItemProtocol? {
        guard let jsonItem = json[item] as? [String: Any] else { return nil }
        let categories: [NewsCategoryProtocol] = parseCategories(from: jsonItem)
        
        guard let generalJson = jsonItem["General"] as? [String: Any] else { return nil }
        guard let main = parseCategory("Main", from: generalJson) else { return nil }
        guard let latest = parseCategory("Latest", from: generalJson) else { return nil }
        
        let providerItem = NewsProviderItem(name: item, categories: categories, main: main, latest: latest)
        return providerItem
    }
    
    private func parseCategories(from json: [String: Any]) -> [NewsCategoryProtocol] {
        var categories: [NewsCategoryProtocol] = []
        
        if let categoriesJson = json["Categories"] as? [String: Any] {
            for categoryJsonItem in categoriesJson {
                let catName = categoryJsonItem.key
                guard let catUrl = categoryJsonItem.value as? String else { continue }
                let categoryItem = NewsCategory(name: catName, url: catUrl)
                categories.append(categoryItem)
            }
        }
        
        return categories
    }
    
    private func parseCategory(_ name: String, from json: [String: Any]) -> NewsCategoryProtocol? {
        guard let catName = json.first(where: { $0.key == name })?.key else { return nil }
        guard let catUrl = json.first(where: { $0.key == name })?.value as? String else { return nil }
        let category: NewsCategoryProtocol = NewsCategory(name: catName, url: catUrl)
        return category
    }
    
}
