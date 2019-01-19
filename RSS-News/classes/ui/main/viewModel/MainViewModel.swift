//
//  MainViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol MainViewModelType: ViewModelType {
    func changeTabAction(to: TabBarItemProtocol, from: TabBarItemProtocol)
}

final class MainViewModel: BaseViewModel<MainRouter>, MainViewModelType {
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    // MARK: Actions
    
    func changeTabAction(to: TabBarItemProtocol, from: TabBarItemProtocol) {
        router?.changeTab(to: to, from: from)
    }
    
}

private extension MainViewModel {
    
    func setup() {
        
    }
    
}
