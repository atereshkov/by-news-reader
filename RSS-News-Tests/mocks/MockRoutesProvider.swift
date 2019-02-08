//
//  MockRoutesProvider.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit
@testable import RSS_News

class MockRoutesProvider: RoutesProviderProtocol {
    
    private(set) var views: [ViewType] = []
    
    init(views: [ViewType]) {
        self.views = views
    }
    
    func getViews() -> [ViewType] {
        return views
    }
    
}
