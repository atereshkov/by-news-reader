//
//  NewsView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class NewsView: BaseView<NewsViewModel> {
    
    @IBOutlet weak var switchView: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
    @IBAction func switchAction(_ sender: Any) {
        if switchView.isOn {
            AppSkin.setTheme(.white)
        } else {
            AppSkin.setTheme(.dark)
        }
    }
    
}

private extension NewsView {
    
    func setupView() {
        //        navigationItem.backBarButtonTitle = ""
        //        navigationController?.setupCustomBackButton()
    }
    
}
