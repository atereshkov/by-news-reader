//
//  AppSkin.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

struct AppSkin {
    
    static func applyAppearance() {
        UINavigationBar.appearance().theme_tintColor = "Global.NavigationBarButtonsColor"
        UINavigationBar.appearance().theme_barTintColor = "Global.NavigationBarBackgroundColor"
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [.font: Fonts.navBarTitle.uiFont, .foregroundColor: UIColor.white]
        
        UIPageControl.appearance().themeBackgroundColor = "Onboarding.PageControl.BackgroundColor"
        UIPageControl.appearance().theme_currentPageIndicatorTintColor = "Onboarding.PageControl.CurrentPageIndicatorColor"
    }
    
}
