//
//  CategoryNewsCell.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

class CategoryNewsCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func update(with item: CategoryNewsItemProtocol) {
        
    }
    
}
