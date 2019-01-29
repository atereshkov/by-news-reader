//
//  SettingsProviderView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

final class SettingsProviderView: BaseView<SettingsProviderViewModel>, UITableViewDelegate, UITableViewDataSource {
    
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
        viewModel?.showAlert = { [weak self] title, msg, buttons in
            self?.showAlert(title: title, message: msg, buttons: buttons)
        }
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel?.itemSelected(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel?.item(for: indexPath.row) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell") as? ProviderCell else { return UITableViewCell() }
        let isSelected = viewModel?.isSelected(indexPath.row) ?? false
        cell.bind(item, isSelected: isSelected)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsCount.value ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = UIDevice.isPhone ? 44.0 : 55
        return rowHeight
    }
    
}

private extension SettingsProviderView {
    
    func setupView() {
        title = L10n.SettingsProvider.title
        
        let infoButton: UIBarButtonItem = .informationButton { [weak self] in
            self?.viewModel?.informationButtonAction()
        }
        navigationItem.rightBarButtonItem = infoButton
    }
    
}
