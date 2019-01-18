//
//  BaseView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

typealias ViewType = UIViewController

class BaseView<ViewModel: ViewModelType>: ViewType {
    
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel?.onViewDidLoad()
    }
    
    func bindViewModel() {
        
    }
    
}
