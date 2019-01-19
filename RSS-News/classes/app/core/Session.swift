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
        container.register(NetworkManagerProtocol.self) { resolver -> NetworkManagerProtocol in
            return NetworkManager()
        }.inObjectScope(.container)
        
        container.register(ParseServiceProtocol.self) { resolver -> ParseServiceProtocol in
            return ParseService()
        }.inObjectScope(.container)
    }
    
    func resolve<T>() -> T {
        guard let service = container.resolve(T.self) else {
            fatalError("Service is not registered '\(String(describing: T.self))'")
        }
        return service
    }
    
}
