//
//  NetworkManager.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    
    var sessionManager: SessionManager { get }
    
}

final class NetworkManager: NetworkManagerProtocol {
    
    private struct Constants {
        static let requestTimeout: TimeInterval = 40 // sec
        static let resourceTimeout: TimeInterval = 40 // sec
    }
    
    private(set) var sessionManager = SessionManager()
    
    init() {
        let configuration: URLSessionConfiguration = .default
        configuration.timeoutIntervalForRequest = Constants.requestTimeout
        configuration.timeoutIntervalForResource = Constants.resourceTimeout
        sessionManager = SessionManager(configuration: configuration)
    }
    
}
