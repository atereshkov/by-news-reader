//
//  NewsCell.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/22/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    private struct Constants {
        static let fullTimeFormat = "dd-MM-yyyy HH:mm"
    }
    
    @IBOutlet weak var bookmarkIcon: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        bookmarkIcon.isHidden = true
    }
    
    func update(with item: NewsItemProtocol, bookmarked: Bool) {
        titleLabel.text = item.title
        bookmarkIcon.isHidden = !bookmarked
        
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
