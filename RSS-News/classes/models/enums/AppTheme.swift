//
//  AppTheme.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 2/8/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

enum AppTheme: String {
    case white = "theme.white"
    case dark = "theme.dark"
    case paper = "theme.paper"
    
    func plistName() -> String {
        switch self {
        case .white:
            return "White"
        case .dark:
            return "Dark"
        case .paper:
            return "Paper"
        }
    }
    
    var localized: String {
        return self.rawValue.localized
    }
    
}
