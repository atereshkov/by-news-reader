//
//  ReachabilityService.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import Reachability
import ReactiveSwift

protocol ReachabilityServiceProtocol {
    var isReachable: MutableProperty<Bool> { get set }
    var isReachableViaWiFi: Bool { get }
}

class ReachabilityService: ReachabilityServiceProtocol {
    
    private let reachability = Reachability()!
    
    init() {
        start()
    }
    
    deinit {
        stop()
    }
    
    // MARK: Public
    
    var isReachable: MutableProperty<Bool> = MutableProperty(false)
    
    var isReachableViaWiFi: Bool {
        return reachability.connection == .wifi
    }
    
    // MARK: Private
    
    private func start() {
        do {
            try self.reachability.startNotifier()
            LoggerService.log.debug("Started.")
            
            if reachability.connection != .none {
                LoggerService.log.debug("Reachable at startup")
                isReachable.value = true
            }
        } catch {
            LoggerService.log.debug("Unable to start notifier.")
        }
        
        // main thread closure
        reachability.whenReachable = { [weak self] _ in
            self?.isReachable.value = true
            LoggerService.log.debug("WhenReachable")
        }
        
        // main thread closure
        reachability.whenUnreachable = { [weak self] _ in
            self?.isReachable.value = false
            LoggerService.log.debug("WhenUnReachable")
        }
    }
    
    private func stop() {
        reachability.stopNotifier()
    }
    
}
