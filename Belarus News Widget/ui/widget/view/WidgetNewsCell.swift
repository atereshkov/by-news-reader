//
//  WidgetNewsCell.swift
//  Belarus-News-Widget
//
//  Created by Alexander Tereshkov on 2/4/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import Kingfisher

class WidgetNewsCell: UITableViewCell {
    
    private struct Constants {
        static let fullTimeFormat = "dd-MM-yyyy HH:mm"
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
    }
    
    func update(with item: NewsItemProtocol) {
        titleLabel.text = item.title
        
        if let date = item.pubDate {
            let timeAgo = DateUtils.timeAgo(from: date, fullTimeFormat: Constants.fullTimeFormat)
            timeLabel.text = timeAgo
        } else {
            timeLabel.text = ""
        }
        
        if let url = URL(string: item.iconURL) {
            iconImageView.kf.setImage(with: url)
        } else {
            iconImageView.image = Asset.Images.noImageRound.image
        }
    }
    
}
