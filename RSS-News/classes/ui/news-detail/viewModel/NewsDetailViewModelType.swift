//
//  NewsDetailViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/21/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

protocol NewsDetailViewModelType: ViewModelType {
    
    // MARK: Actions
    
    func webViewLoadingDidChange(_ isLoading: Bool)
    func webViewDidFailLoad(error: Error)
    
    // MARK: Datasource
    
    var itemURL: URLRequest? { get }
    var viewTitle: String? { get }
    
    var isLoading: MutableProperty<Bool> { get }
    
}
