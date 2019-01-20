//
//  CategoryNewsCell.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryNewsCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
    }
    
    func update(with item: CategoryNewsItemProtocol) {
        titleLabel.text = item.title
        
        if let url = URL(string: item.iconURL) {
            iconImageView.kf.setImage(with: url)
        }
    }
    
}
