//
//  RegionCell.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

class RegionCell: UITableViewCell {
    
    @IBOutlet weak var markImageView: UIImageView!
    @IBOutlet private weak var leftLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        markImageView.isHidden = true
    }
    
    func bind(_ item: RegionItemProtocol, isSelected: Bool) {
        leftLabel.text = item.name
        markImageView.isHidden = !isSelected
    }
    
}
