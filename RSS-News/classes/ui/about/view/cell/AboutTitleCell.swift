//
//  AboutTitleCell.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/29/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

class AboutTitleCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func bind(_ item: AboutTitleItem) {
        titleLabel.text = item.title
    }
    
}
