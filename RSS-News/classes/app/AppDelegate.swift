//
//  AppDelegate.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // swiftlint:disable force_cast
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    // swiftlint:enable force_cast
    
    var window: UIWindow?
    private(set) var router: AppRouter?
    private var session: Session?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupSharedServices()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        AppSkin.setup()
        AppSkin.applyAppearance()
        
        let session = Session()
        self.session = session
        
        router = AppRouter(window: window, session: session)
        router?.start()
        
        configureRealm()
        
        return true
    }
    
    private func setupSharedServices() {
        // Debug logger setup
        LoggerService.shared.initialize()
    }
    
    private func configureRealm() {
        let version: UInt64 = 3
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: version)
    }

}
