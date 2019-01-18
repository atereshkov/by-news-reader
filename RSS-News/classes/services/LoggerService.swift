//
//  LoggerService.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import EXPLogger

class LoggerService: NSObject {
    
    static let shared = LoggerService()
    static let log = LoggerService().logger
    
    private let logger = EXPLogger.self
    
    // MARK: Init
    
    func initialize() {
        let console = ConsoleTarget()
        console.minLogLevel = .verbose
        logger.addTarget(console)
    }
    
}
