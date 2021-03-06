//
//  UIViewController.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/24/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

extension UIBarButtonItem {
    
    static func spacer(offset: Int = 20) -> UIBarButtonItem {
        let positiveSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        positiveSpacer.width = +CGFloat(offset)
        return positiveSpacer
    }
    
    static func rightTextBtn(title: String, _ action: @escaping () -> Void) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        //button.setTitleColor(Asset.Colors.Common.NavBar.navBarRightTitle.color, for: .normal)
        button.titleLabel?.font = Fonts.navBarRightButton.uiFont
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 0)
        button.sizeToFit()
        button.reactive
            .controlEvents(.touchUpInside).take(duringLifetimeOf: button)
            .observeValues { _ in
                action()
        }
        return UIBarButtonItem(customView: button)
    }
    
    static func shareButton(_ action: @escaping () -> Void) -> UIBarButtonItem {
        let img = Asset.Images.Icons.share.image
        return button(image: img, action: action)
    }
    
    static func bookmarkedButton(_ action: @escaping () -> Void) -> UIBarButtonItem {
        let img = Asset.Images.Icons.bookmarkedNavbar.image
        return button(image: img, action: action)
    }
    
    static func bookmarkEmptyButton(_ action: @escaping () -> Void) -> UIBarButtonItem {
        let img = Asset.Images.Icons.bookmarkEmpty.image
        return button(image: img, action: action)
    }
    
    static func informationButton(_ action: @escaping () -> Void) -> UIBarButtonItem {
        let img = Asset.Images.Icons.informationNavbar.image
        return button(image: img, action: action)
    }
    
    private static func button(image: UIImage, action: @escaping () -> Void) -> UIBarButtonItem {
        let btn = UIButton(type: .system)
        btn.setImage(image, for: .normal)
        btn.reactive.controlEvents(.touchUpInside).take(duringLifetimeOf: btn).observeValues { _ in
            action()
        }
        return UIBarButtonItem(customView: btn)
    }
    
}
