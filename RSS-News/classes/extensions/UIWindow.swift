//
//  UIWindow.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

extension UIWindow {
    
    func setRootViewController(_ controller: UIViewController, animated: Bool, completion: ((Bool) -> Void)?) {
        let present = { [weak self] in
            guard let strongSelf = self else {
                completion?(false)
                return
            }
            if animated {
                UIView.transition(with: strongSelf, duration: CATransaction.animationDuration(), options: [.transitionCrossDissolve], animations: { [weak self] in
                    self?.rootViewController = controller
                    }, completion: completion)
            } else {
                strongSelf.rootViewController = controller
                completion?(true)
            }
        }
        
        present()
    }
    
}
