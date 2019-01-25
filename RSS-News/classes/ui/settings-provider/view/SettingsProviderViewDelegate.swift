//
//  SettingsProviderViewDelegate.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/26/19.
//  Copyright © 2019 AT. All rights reserved.
//

protocol SettingsProviderViewDelegate: BaseViewDelegate {
    func providerChanged(to: NewsProviderItemProtocol)
}
