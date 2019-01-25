//
//  SettingsCityViewDelegate.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

protocol SettingsCityViewDelegate: BaseViewDelegate {
    func regionChanged(to: RegionItemProtocol)
}
