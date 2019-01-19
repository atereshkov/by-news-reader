//
//  ServiceError.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

enum ServiceError: Error {
    case parseError(Error?)
    case unknown
    case cancelled
}
