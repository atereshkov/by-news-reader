//
//  CategoriesViewModel.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import ReactiveSwift

final class CategoriesViewModel: BaseViewModel<CategoriesRouter>, CategoriesViewModelType {
    
    // MARK: Callbacks
    
    var updateState: ((CategoriesViewState) -> Void)?
    
    // MARK: Properties
    
    var items: MutableProperty<[NewsCategoryProtocol]> = MutableProperty([])
    var itemsCount: Property<Int> {
        return items.map { $0.count }
    }
    
    private var bindDisposable: ScopedDisposable<AnyDisposable>?
    
    private var providerService: ProvidersServiceProtocol
    
    // MARK: Init
    
    override init(session: SessionType, delegate: BaseViewDelegate?) {
        self.providerService = session.resolve()
        super.init(session: session, delegate: delegate)
        
        setup()
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
    }
    
    // MARK: Actions
    
    func itemSelected(at index: Int) {
        guard let item = item(for: index) else { return }
        router?.goToCategoryNews(item: item)
    }
    
    // MARK: DataSource
    
    func item(for index: Int) -> NewsCategoryProtocol? {
        guard index >= 0 && index < items.value.count else { return nil }
        return items.value[index]
    }
    
}

private extension CategoriesViewModel {
    
    func setup() {
        let disposable = CompositeDisposable()
        bindDisposable = ScopedDisposable(disposable)
        
        disposable += providerService.currentProvider.producer.startWithValues({ [weak self] provider in
            self?.providerChanged(to: provider)
        })
    }
    
    func setupItems(with provider: NewsProviderItemProtocol) {
        items.value = provider.categories
        items.value.sort(by: { $0.order ?? 0 < $1.order ?? 1 })
        updateState?(.reloadItems)
    }
    
}

extension CategoriesViewModel {
    
    func providerChanged(to provider: AppProviderEnum) {
        guard let providerItem = providerService.getProviderItem(provider) else { return }
        setupItems(with: providerItem)
    }
    
}
