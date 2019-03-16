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
import BugfenderSDK

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
            if reachability.connection != .none {
                isReachable.value = true
            }
        } catch {
            Bugfender.error("Unable to start notifier: \(error)")
        }
        
        // main thread closure
        reachability.whenReachable = { [weak self] _ in
            self?.isReachable.value = true
        }
        
        // main thread closure
        reachability.whenUnreachable = { [weak self] _ in
            self?.isReachable.value = false
        }
    }
    
    private func stop() {
        reachability.stopNotifier()
    }
    
}
