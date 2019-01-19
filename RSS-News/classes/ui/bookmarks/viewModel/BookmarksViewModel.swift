//
//  BookmarksViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

protocol BookmarksViewModelType: ViewModelType {
    
}

final class BookmarksViewModel: BaseViewModel<BookmarksRouter>, BookmarksViewModelType {
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
}

private extension BookmarksViewModel {
    
    func setup() {
        
    }
    
}
