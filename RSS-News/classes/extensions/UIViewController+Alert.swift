//
//  UIViewController+Alert.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/29/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, buttons: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for button in buttons {
            alertController.addAction(button)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
}
