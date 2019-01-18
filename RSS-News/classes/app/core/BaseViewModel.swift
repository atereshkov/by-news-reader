//
//  BaseViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

protocol ViewModelType: class {
    func onViewDidLoad()
}

class BaseViewModel<Router: RouterType>: ViewModelType {
    
    let session: SessionType
    var router: Router?
    weak var delegate: BaseViewDelegate?
    
    init(session: SessionType, delegate: BaseViewDelegate? = nil) {
        self.session = session
        self.delegate = delegate
    }
    
    func onViewDidLoad() {
        
    }
    
}
