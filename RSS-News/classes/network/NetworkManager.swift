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
    
    var sessionManager: Alamofire.Session { get }
    
}

final class NetworkManager: NetworkManagerProtocol {
    
    private struct Constants {
        static let requestTimeout: TimeInterval = 40 // sec
        static let resourceTimeout: TimeInterval = 40 // sec
    }
    
    private(set) var sessionManager = Alamofire.Session()
    
    init() {
        let configuration: URLSessionConfiguration = .default
        configuration.timeoutIntervalForRequest = Constants.requestTimeout
        configuration.timeoutIntervalForResource = Constants.resourceTimeout
        sessionManager = Alamofire.Session(configuration: configuration)
    }
    
}
