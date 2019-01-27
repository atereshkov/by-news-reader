//
//  AboutViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/28/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

final class AboutViewModel: BaseViewModel<AboutRouter>, AboutViewModelType {
    
    // MARK: Init
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
    }
    
}

private extension AboutViewModel {
    
    func setup() {
        
    }
    
}
