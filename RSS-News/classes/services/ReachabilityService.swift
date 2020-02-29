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
}

class ReachabilityService: ReachabilityServiceProtocol {
    
    // swiftlint:disable force_try
    private let reachability = try! Reachability()
    // swiftlint:enable force_try
    
    init() {
        start()
    }
    
    deinit {
        stop()
    }
    
    // MARK: Public
    
    var isReachable: MutableProperty<Bool> = MutableProperty(false)
    
    // MARK: Private
    
    private func start() {
        // main thread closure
        reachability.whenReachable = { [weak self] _ in
            self?.isReachable.value = true
        }
        
        // main thread closure
        reachability.whenUnreachable = { [weak self] _ in
            self?.isReachable.value = false
        }
        
        do {
            try reachability.startNotifier()
            
            if reachability.connection != .unavailable {
                isReachable.value = true
            }
        } catch {
           Bugfender.error("Unable to start notifier: \(error)")
        }
    }
    
    func stop() {
        reachability.stopNotifier()
    }
    
}
