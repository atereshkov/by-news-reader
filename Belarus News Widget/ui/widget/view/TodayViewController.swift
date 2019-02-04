//
//  TodayViewController.swift
//  Belarus News
//
//  Created by Alexander Tereshkov on 2/4/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import NotificationCenter
import ReactiveCocoa
import ReactiveSwift

class TodayViewController: UIViewController {
    
    private struct Constants {
        static let expandedNewsCount = 3
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private let session = Session()
    var viewModel: WidgetViewModelType?
    
    private var bindDisposable: ScopedDisposable<AnyDisposable>?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = WidgetViewModel(session: session, delegate: nil)
        
        bindViewModel()
        viewModel?.onViewDidLoad()
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
    
    func bindViewModel() {
        guard let viewModel = viewModel else { return }
        
        let disposable = CompositeDisposable()
        bindDisposable = ScopedDisposable(disposable)
        
        disposable += activityIndicator.reactive.isAnimating <~ viewModel.isLoading
        
        viewModel.updateState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .reloadItems:
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
}

extension TodayViewController: NCWidgetProviding {
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
        
//        fetchData { [weak self] error in
//            if error == nil {
//                self?.update()
//                completionHandler(.newData)
//            } else {
//                completionHandler(.failed)
//            }
//        }
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        let rowHeight: CGFloat = UIDevice.isPhone ? 110.0 : 160.0
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height: CGFloat(Constants.expandedNewsCount) * rowHeight) : maxSize
    }
    
}

extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel?.itemSelected(at: indexPath.row, context: extensionContext)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel?.item(for: indexPath.row) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WidgetNewsCell") as? WidgetNewsCell else { return UITableViewCell() }
        cell.update(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsCount.value ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = UIDevice.isPhone ? 110.0 : 160
        return rowHeight
    }
    
}
