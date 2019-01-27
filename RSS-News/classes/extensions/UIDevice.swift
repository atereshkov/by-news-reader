//
//  UserDevice.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/28/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    
    public class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    public class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    public class var isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == .tv
    }
    
    public class var isCarPlay: Bool {
        return UIDevice.current.userInterfaceIdiom == .carPlay
    }
    
}
