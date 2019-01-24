//
//  ShareRoutable.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/24/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

protocol ShareRoutable {
    func share(link: String, sender: UIView?)
}

extension ShareRoutable where Self: RouterType {
    
    func share(link: String, sender: UIView?) {
        let sharableLink = [link]
        let activityVC = UIActivityViewController(activityItems: sharableLink, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = sender
        self.view?.present(activityVC, animated: true, completion: nil)
    }
    
}
