//
//  Session.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import Swinject

protocol SessionType {
    func resolve<T>() -> T
}

final class Session: SessionType {
    
    private let container = Container()
    
    init() {
        container.register(NetworkManagerProtocol.self) { _ -> NetworkManagerProtocol in
            return NetworkManager()
        }.inObjectScope(.container)
        
        container.register(RealmServiceProtocol.self) { _ -> RealmServiceProtocol in
            return RealmService()
        }.inObjectScope(.container)
        
        container.register(ReachabilityServiceProtocol.self) { _ -> ReachabilityServiceProtocol in
            return ReachabilityService()
        }.inObjectScope(.container)
        
        container.register(ParseServiceProtocol.self) { _ -> ParseServiceProtocol in
            return ParseService()
        }.inObjectScope(.container)
        
        container.register(ProvidersServiceProtocol.self) { resolver -> ProvidersServiceProtocol in
            guard let preferenceService = resolver.resolve(AppPreferenceServiceProtocol.self) else {
                fatalError("AppPreferenceServiceProtocol is not registered")
            }
            // TODO inject AppConfig
            let repository = PlistProvidersRepository(plistName: "Providers")
            let providersParser: ProvidersParserProtocol = ProvidersParser(repository)
            return ProvidersService(providersParser, preferenceService)
        }.inObjectScope(.container)
        
        container.register(AppPreferenceServiceProtocol.self) { _ -> AppPreferenceServiceProtocol in
            return AppPreferenceService(userDefaults: UserDefaults.standard)
        }.inObjectScope(.container)
        
        container.register(AppThemeServiceProtocol.self) { resolver -> AppThemeServiceProtocol in
            guard let preferenceService = resolver.resolve(AppPreferenceServiceProtocol.self) else {
                fatalError("AppPreferenceServiceProtocol is not registered")
            }
            return AppThemeService(preferenceService)
        }.inObjectScope(.container)
    }
    
    func resolve<T>() -> T {
        guard let service = container.resolve(T.self) else {
            fatalError("Service is not registered '\(String(describing: T.self))'")
        }
        return service
    }
    
}
