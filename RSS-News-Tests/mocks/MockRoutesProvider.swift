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
    
    func getViews() -> [ViewType] {
        let page1 = UIViewController()
        let page2 = UIViewController()
        
        return [page1, page2]
    }
    
}
