//
//  TabBarButton.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/19/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit
import PinLayout
import ReactiveSwift
import SwiftTheme

class TabBarButton: UIControl {
    
    @IBInspectable var topInset: CGFloat = 7 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    @IBInspectable var space: CGFloat = 2 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
            setNeedsLayout()
        }
    }
    
    @IBInspectable var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            setNeedsLayout()
        }
    }
    
    @IBInspectable var adjustBackgroundColor: Bool = false
    
    override var tintColor: UIColor! {
        didSet {
            updateColor()
        }
    }
    
    private(set) var imageView: UIImageView!
    private(set) var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.pin.hCenter().top(topInset)
        label.pin.below(of: imageView).marginTop(space).left().right()
    }
    
    override var intrinsicContentSize: CGSize {
        label.sizeToFit()
        imageView.sizeToFit()
        let size = CGSize(width: max(label.bounds.size.width, imageView.bounds.size.width), height: imageView.bounds.size.height + space + label.bounds.size.height + topInset)
        return size
    }
    
    override func sizeToFit() {
        frame.size = intrinsicContentSize
    }
    
    override var isHighlighted: Bool {
        didSet {
            let alpha: CGFloat = isHighlighted ? 0.5 : 1
            imageView.alpha = alpha
            label.alpha = alpha
            if adjustBackgroundColor {
                theme_backgroundColor = isHighlighted ? "TabBar.ItemColorSelected" : "TabBar.ItemColorDefault"
            }
        }
    }
    
}

private extension TabBarButton {
    
    func updateColor() {
        label.textColor = tintColor
        imageView.tintColor = tintColor
    }
    
    func setup() {
        imageView = UIImageView(frame: .zero)
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.theme_tintColor = "TabBar.ItemColorDefault"
        addSubview(imageView)
        
        label = UILabel(frame: .zero)
        label.theme_textColor = "TabBar.ItemColorDefault"
        label.font = Fonts.tabBarButton.uiFont
        label.textAlignment = .center
        addSubview(label)
        
        imageView.tintColor = tintColor
        label.textColor = tintColor
    }
    
}
