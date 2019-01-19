//
//  MainView.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import FeedKit
import SwiftTheme

final class MainView: BaseView<MainViewModel> {
    
    var tabBar: HomeTabBarProtocol?
    
    @IBOutlet weak var tabBarStackView: UIStackView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
//        let feedURL = URL(string: "https://news.tut.by/rss/geonews/minsk.rss")!
//        let parser = FeedParser(URL: feedURL)
//        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
//            DispatchQueue.main.async { [weak self] in
//                guard let feed = result.rssFeed, result.isSuccess else {
//                    print(result.error)
//                    return
//                }
//                Swift.print(feed.items?.count)
//            }
//        }
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
}

private extension MainView {
    
    func setupView() {
        navigationItem.backBarButtonTitle = ""
        
        tabBar?.delegate = self
        tabBar?.initialize()
    }
    
}

extension MainView: HomeTabBarDelegate {
    
    func setupTabBar(_ items: [TabBarItemProtocol]) {
        let buttons = items.map({ $0.button })
        for button in buttons {
            tabBarStackView.addArrangedSubview(button)
        }
    }
    
    func controllerSwitched(to: TabBarItemProtocol, from: TabBarItemProtocol) {
        viewModel?.changeTabAction(to: to, from: from)
    }
    
}
