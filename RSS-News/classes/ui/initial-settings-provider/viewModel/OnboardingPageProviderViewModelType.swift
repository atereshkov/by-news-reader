//
//  OnboardingPageProviderViewModelType.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/31/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

protocol OnboardingPageProviderViewModelType: ViewModelType {
    
    // MARK: Actions
    
    func itemSelected(at index: Int)
    
    // MARK: Callbacks
    
    var updateState: ((_ state: OnboardingProviderViewState) -> Void)? { get set }
    
    // MARK: Properies
    
    var items: MutableProperty<[NewsProviderItemProtocol]> { get }
    var itemsCount: Property<Int> { get }
    
    // MARK: DataSources
    
    func item(for index: Int) -> NewsProviderItemProtocol?
    func isSelected(_ index: Int) -> Bool
    
}
