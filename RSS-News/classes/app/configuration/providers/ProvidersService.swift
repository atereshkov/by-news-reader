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
    func getProviderItem(_ provider: AppProviderEnum) -> NewsProviderItemProtocol
}

extension ProvidersServiceProtocol {
    func getProviderItems(_ plistName: String = ProvidersService.Constants.providerListFileName) -> [NewsProviderItemProtocol] {
        return getProviderItems(plistName)
    }
}

final class ProvidersService: ProvidersServiceProtocol {
    
    struct Constants {
        static let providerListFileName = "Providers"
    }
    
    func getProviderItems(_ plistName: String = Constants.providerListFileName) -> [NewsProviderItemProtocol] {
        guard let path = Bundle.main.path(forResource: plistName, ofType: "plist") else { return [] }
        guard let json = NSDictionary(contentsOfFile: path) as? [String: Any] else { return [] }
        
        // TODO extract parsing to PlistParserService
        var items: [NewsProviderItemProtocol] = []
        for item in json {
            if let jsonItem = json[item.key] as? [String: Any] {
                var categories: [NewsCategoryProtocol] = []
                if let categoriesJson = jsonItem["Categories"] as? [String: Any] {
                    for categoryJsonItem in categoriesJson {
                        let catName = categoryJsonItem.key
                        guard let catUrl = categoryJsonItem.value as? String else { continue }
                        let categoryItem = NewsCategory(name: catName, url: catUrl)
                        categories.append(categoryItem)
                    }
                }
                guard let generalJson = jsonItem["General"] as? [String: Any] else { continue }
                guard let mainName = generalJson.first(where: { $0.key == "Main" })?.key else { continue }
                guard let mainUrl = generalJson.first(where: { $0.key == "Main" })?.value as? String else { continue }
                let main: NewsCategoryProtocol = NewsCategory(name: mainName, url: mainUrl)
                
                guard let latestName = generalJson.first(where: { $0.key == "Latest" })?.key else { continue }
                guard let latestUrl = generalJson.first(where: { $0.key == "Latest" })?.value as? String else { continue }
                let latest: NewsCategoryProtocol = NewsCategory(name: latestName, url: latestUrl)
                
                let providerItem = NewsProviderItem(name: item.key, categories: categories, main: main, latest: latest)
                items.append(providerItem)
            }
        }
        
        return items
    }
    
    func getProviderItem(_ provider: AppProviderEnum) -> NewsProviderItemProtocol {
        let mainCat: NewsCategoryProtocol = NewsCategory(name: "Test", url: "Test")
        let latestCat: NewsCategoryProtocol = NewsCategory(name: "Test", url: "Test")
        return NewsProviderItem(name: "Test", categories: [], main: mainCat, latest: latestCat)
    }
    
}
