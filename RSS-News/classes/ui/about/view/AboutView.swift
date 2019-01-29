//
//  AboutView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/28/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class AboutView: BaseView<AboutViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel?.item(for: indexPath.row) else { return UITableViewCell() }
        if let item = item as? AboutListItem {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier) as? AboutCell else { return UITableViewCell() }
            cell.bind(item)
            return cell
        } else if let item = item as? AboutTitleItem {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier) as? AboutTitleCell else { return UITableViewCell() }
            cell.bind(item)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsCount.value ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

private extension AboutView {
    
    func setupView() {
        title = L10n.About.title
    }
    
}
