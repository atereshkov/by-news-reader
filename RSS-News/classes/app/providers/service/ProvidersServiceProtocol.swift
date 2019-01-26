//
//  ProvidersServiceProtocol.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

protocol ProvidersServiceProtocol {
    func getProviderItems(_ plistName: String) -> [NewsProviderItemProtocol]
    func getProviderItem(_ provider: AppProviderEnum, plistName: String) -> NewsProviderItemProtocol?
    func getCurrentProviderItem() -> NewsProviderItemProtocol?
    func changeProvider(to provider: AppProviderEnum)
    
    var currentProvider: Property<AppProviderEnum> { get }
}
