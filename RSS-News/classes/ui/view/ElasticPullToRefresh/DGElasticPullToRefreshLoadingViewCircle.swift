//
//  DGElasticPullToRefreshLoadingViewCircle.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/22/19.
//  Copyright © 2019 AT. All rights reserved.
//

import UIKit

// MARK: -
// MARK: (CGFloat) Extension
public extension CGFloat {
    
    public func toRadians() -> CGFloat {
        return (self * CGFloat.pi) / 180.0
    }
    
    public func toDegrees() -> CGFloat {
        return self * 180.0 / CGFloat.pi
    }
    
}

// MARK: -
// MARK: DGElasticPullToRefreshLoadingViewCircle
open class DGElasticPullToRefreshLoadingViewCircle: DGElasticPullToRefreshLoadingView {
    
    // MARK: -
    // MARK: Vars
    
    fileprivate let kRotationAnimation = "kRotationAnimation"
    
    fileprivate let shapeLayer = CAShapeLayer()
    fileprivate lazy var identityTransform: CATransform3D = {
        var transform = CATransform3DIdentity
        transform.m34 = CGFloat(1.0 / -500.0)
        transform = CATransform3DRotate(transform, CGFloat(-90.0).toRadians(), 0.0, 0.0, 1.0)
        return transform
    }()
    
    // MARK: -
    // MARK: Constructors
    
    public override init() {
        super.init(frame: .zero)
        
        shapeLayer.lineWidth = 1.0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = tintColor.cgColor
        shapeLayer.actions = ["strokeEnd" : NSNull(), "transform" : NSNull()]
        shapeLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer.addSublayer(shapeLayer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Methods
    
    override open func setPullProgress(_ progress: CGFloat) {
        super.setPullProgress(progress)
        
        shapeLayer.strokeEnd = min(0.9 * progress, 0.9)
        
        if progress > 1.0 {
            let degrees = ((progress - 1.0) * 200.0)
            shapeLayer.transform = CATransform3DRotate(identityTransform, degrees.toRadians(), 0.0, 0.0, 1.0)
        } else {
            shapeLayer.transform = identityTransform
        }
    }
    
    override open func startAnimating() {
        super.startAnimating()
        
        if shapeLayer.animation(forKey: kRotationAnimation) != nil { return }
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat.pi * 2 + currentDegree()
        rotationAnimation.duration = 1.0
        rotationAnimation.repeatCount = Float.infinity
        rotationAnimation.isRemovedOnCompletion = false
        rotationAnimation.fillMode = CAMediaTimingFillMode.forwards
        shapeLayer.add(rotationAnimation, forKey: kRotationAnimation)
    }
    
    override open func stopLoading() {
        super.stopLoading()
        
        shapeLayer.removeAnimation(forKey: kRotationAnimation)
    }
    
    fileprivate func currentDegree() -> CGFloat {
        // swiftlint:disable force_cast
        return shapeLayer.value(forKeyPath: "transform.rotation.z") as! CGFloat
        // swiftlint:enable force_cast
    }
    
    override open func tintColorDidChange() {
        super.tintColorDidChange()
        
        shapeLayer.strokeColor = tintColor.cgColor
    }
    
    // MARK: -
    // MARK: Layout
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        shapeLayer.frame = bounds
        
        let inset = shapeLayer.lineWidth / 2.0
        shapeLayer.path = UIBezierPath(ovalIn: shapeLayer.bounds.insetBy(dx: inset, dy: inset)).cgPath
    }
    
}
