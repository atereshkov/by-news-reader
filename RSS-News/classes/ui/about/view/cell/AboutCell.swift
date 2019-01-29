//
//  AboutCell.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/29/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import UIKit

class AboutCell: UITableViewCell {
    
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet private weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(_ item: AboutListItem) {
        infoLabel.text = item.text
        separatorView.isHidden = !item.showSeparator
    }
    
}
