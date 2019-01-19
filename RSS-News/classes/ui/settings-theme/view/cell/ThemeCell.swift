//
//  ThemeCell.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

class ThemeCell: UITableViewCell {
    
    @IBOutlet weak var markImageView: UIImageView!
    @IBOutlet private weak var leftLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        markImageView.isHidden = true
    }
    
    func bind(_ item: ThemeItemProtocol, isSelected: Bool) {
        leftLabel.text = item.title
        markImageView.isHidden = !isSelected
    }
    
}
