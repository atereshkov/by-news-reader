//
//  CategoryNews.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

final class CategoryNewsView: BaseView<CategoryNewsViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private var bindDisposable: ScopedDisposable<AnyDisposable>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        guard let viewModel = viewModel else { return }
        
        let disposable = CompositeDisposable()
        bindDisposable = ScopedDisposable(disposable)
        
        disposable += activityIndicator.reactive.isAnimating <~ viewModel.parseAction.isExecuting
        disposable += viewModel.screenTitle.producer.startWithValues { [weak self] title in
            self?.title = title
        }
        
        viewModel.updateState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .reloadItems:
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel?.itemSelected(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel?.item(for: indexPath.row) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryNewsCell") as? CategoryNewsCell else { return UITableViewCell() }
        cell.update(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsCount.value ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 100.0
        return rowHeight
    }
    
}

private extension CategoryNewsView {
    
    func setupView() {
        navigationItem.backBarButtonTitle = ""
    }
    
}
