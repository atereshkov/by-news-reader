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
        
        container.register(ParseServiceProtocol.self) { _ -> ParseServiceProtocol in
            return ParseService()
        }.inObjectScope(.container)
        
        container.register(PlistParserServiceProtocol.self) { _ -> PlistParserServiceProtocol in
            return PlistParserService()
        }.inObjectScope(.container)
        
        container.register(ProvidersServiceProtocol.self) { resolver -> ProvidersServiceProtocol in
            guard let plistParserService = resolver.resolve(PlistParserServiceProtocol.self) else {
                fatalError("PlistParserServiceProtocol is not registered")
            }
            return ProvidersService(plistParserService)
        }.inObjectScope(.container)
    }
    
    func resolve<T>() -> T {
        guard let service = container.resolve(T.self) else {
            fatalError("Service is not registered '\(String(describing: T.self))'")
        }
        return service
    }
    
}
