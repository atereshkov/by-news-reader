//
//  RouterProvider.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol RoutesProviderProtocol {
    func getViews() -> [ViewType]
}
