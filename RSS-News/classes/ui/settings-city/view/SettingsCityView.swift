//
//  SettingsCity.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class SettingsCityView: BaseView<SettingsCityViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel?.itemSelected(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel?.item(for: indexPath.row) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegionCell") as? RegionCell else { return UITableViewCell() }
        let isSelected = viewModel?.isSelected(indexPath.row) ?? false
        cell.bind(item, isSelected: isSelected)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsCount.value ?? 0
    }
    
}

private extension SettingsCityView {
    
    func setupView() {
        title = L10n.SettingsCity.title
        
        let infoButton: UIBarButtonItem = .informationButton { [weak self] in
            self?.viewModel?.informationButtonAction()
        }
        navigationItem.rightBarButtonItem = infoButton
    }
    
}
