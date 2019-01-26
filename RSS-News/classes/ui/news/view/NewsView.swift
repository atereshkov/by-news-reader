//
//  NewsView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

final class NewsView: BaseView<NewsViewModel>, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {
    
    @IBOutlet weak var noInternetView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private var bindDisposable: ScopedDisposable<AnyDisposable>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupPullToRefresh()
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.viewDidAppear()
        navigationController?.navigationBar.topItem?.title = L10n.Feed.title
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        guard let viewModel = viewModel else { return }
        
        let disposable = CompositeDisposable()
        bindDisposable = ScopedDisposable(disposable)
        
        disposable += activityIndicator.reactive.isAnimating <~ viewModel.isLoading
        disposable += noInternetView.reactive.isHidden <~ viewModel.noInternetViewIsHidden
        disposable += tableView.reactive.isHidden <~ viewModel.tableViewIsHidden
        disposable += viewModel.isLoading.producer.startWithValues({ [weak self] showProgress in
            self?.showLoading(showProgress)
        })
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell else { return UITableViewCell() }
        let bookmarked = viewModel?.isBookmarked(indexPath.row) ?? false
        cell.update(with: item, bookmarked: bookmarked)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsCount.value ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 100.0
        return rowHeight
    }
    
    // MARK: UIViewControllerPreviewingDelegate
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
        guard let detailView = viewModel?.detailView(for: indexPath.row) else { return nil }
        if let cell = tableView.cellForRow(at: indexPath) {
            previewingContext.sourceRect = cell.frame
        }
        return detailView
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        viewModel?.previewPopAction(view: viewControllerToCommit)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if (traitCollection.forceTouchCapability == .available) {
            registerForPreviewing(with: self, sourceView: tableView)
        }
    }
    
}

private extension NewsView {
    
    func setupView() {
        navigationItem.backBarButtonTitle = ""
    }
    
    func setupPullToRefresh() {
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.theme_tintColor = "Global.PullToRefreshLoadingCircleColor"
        
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            self?.viewModel?.pullToRefreshAction()
        }, loadingView: loadingView)
        
        tableView.dg_setPullToRefreshFillColor("Feed.PullToRefresh.FillColor")
        tableView.dg_setPullToRefreshBackgroundColor("Feed.PullToRefresh.BackgroundColor")
    }
    
    func showLoading(_ loading: Bool) {
        if loading {
            
        } else {
            tableView.dg_stopLoading()
        }
    }
    
}
