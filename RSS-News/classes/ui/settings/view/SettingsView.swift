//
//  SettingsView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class SettingsView: BaseView<SettingsViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.topItem?.title = L10n.Settings.title
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel?.updateState = { [weak self] state in
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
        if let item = item as? MenuListItem {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier) as? MenuCell else { return UITableViewCell() }
            cell.bind(item)
            return cell
        } else if item is MenuEmptyItem {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier) as? MenuEmptyCell else { return UITableViewCell() }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsCount.value ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = UIDevice.isPhone ? 44.0 : 55
        return rowHeight
    }
    
}

private extension SettingsView {
    
    func setupView() {
        navigationItem.backBarButtonTitle = ""
    }
    
}
