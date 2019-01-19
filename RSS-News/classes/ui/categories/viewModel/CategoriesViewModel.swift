//
//  CategoriesViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol CategoriesViewModelType: ViewModelType {
    
}

final class CategoriesViewModel: BaseViewModel<CategoriesRouter>, CategoriesViewModelType {
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
}

private extension CategoriesViewModel {
    
    func setup() {
        
    }
    
}
