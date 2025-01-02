//
//  WWHighTechView.swift
//  WWHighTechView
//
//  Created by William.Weng on 2024/12/31.
//

import UIKit

// MARK: - 有科技感的View
open class WWHighTechView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var borderViews: [UIView]!
    @IBOutlet var borderSubViews: [UIView]!
    @IBOutlet var distanceConstraints: [NSLayoutConstraint]!

    @IBOutlet weak var containerView: UIView!
    
    private let transform3DRotation = (start: CATransform3DMakeRotation(CGFloat.pi * 0.48, 0, 1, 0), end: CATransform3DMakeRotation(CGFloat.pi * 0.0, 0, 1, 0))
    
    private var duration: CFTimeInterval = 0.5
    private var repeatFlashCount: Double = 2.0
    
    private var animationCount = 0
    private var animationKey: TransitionAnimationKeyPath?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        initSetting()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSetting()
    }
}

// MARK: - CAAnimationDelegate
extension WWHighTechView: CAAnimationDelegate {}
public extension WWHighTechView {
    
    func animationDidStart(_ anim: CAAnimation) {}
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        animationDidStopAction(anim: anim, finished: flag)
    }
}

// MARK: - 小工具
public extension WWHighTechView {
    
    /// [啟動動畫功能](https://588ku.com/video/27048571.html)
    /// - Parameters:
    ///   - duration: [總執行時間 - 3組動畫](https://chillcomponent.codlin.me/components/card-futuristic/)
    ///   - innerView: 要加入的View
    ///   - repeatFlashCount: 閃動動畫執行的次數
    ///   - highTechColor: 主色調
    func start(duration: CFTimeInterval = 1.5, innerView: UIView, repeatFlashCount: Double = 2.0, highTechColor: UIColor = UIColor(red: 126 / 255, green: 252 / 255, blue: 250, alpha: 1.0)) {
        
        self.animationKey = .opacity
        self.repeatFlashCount = repeatFlashCount
        self.duration = duration / (Double(borderViews.count) + repeatFlashCount - 1.0)
        
        innerView._autolayout(on: containerView)
        
        highTechColorSetting(highTechColor)
        borderViews.forEach { $0.isHidden = false }
        opacityAnimation(duration: self.duration)
    }
}

// MARK: - 小工具
private extension WWHighTechView {
    
    /// 初始化設定
    func initSetting() {
        initViewFromXib()
        initViewSetting()
    }
    
    /// 讀取Nib畫面 => 加到View上面
    func initViewFromXib() {
        
        let bundle = Bundle.module
        let name = String(describing: WWHighTechView.self)
        
        bundle.loadNibNamed(name, owner: self, options: nil)
        contentView.frame = bounds
        
        addSubview(contentView)
    }
    
    /// 初始化一些View的位置設定
    func initViewSetting() {
        containerView.isHidden = true
        borderViews.forEach { $0.isHidden = true }
        fixTransformAnimation()
    }
    
    /// 透明度動畫
    /// - Parameter duration: CFTimeInterval
    func opacityAnimation(duration: CFTimeInterval) {
        
        let keyPath: TransitionAnimationKeyPath = .opacity
        let animation = CAAnimation._basicAnimation(keyPath: keyPath, delegate: self, fromValue: 1.0, toValue: 0.0, duration: duration, repeatCount: Float(repeatFlashCount), isRemovedOnCompletion: true)
        
        containerView.isHidden = true
        borderViews.forEach { $0.layer.add(animation, forKey: keyPath.rawValue) }
        fixTransformAnimation()
    }
    
    /// y軸旋轉動畫
    /// - Parameter duration: CFTimeInterval
    func transformAnimation(duration: CFTimeInterval) {
        
        let keyPath: TransitionAnimationKeyPath = .transform
        let animation = CAAnimation._basicAnimation(keyPath: keyPath, delegate: self, fromValue: transform3DRotation.start, toValue: transform3DRotation.end, duration: duration)
        
        borderViews.forEach { $0.layer.add(animation, forKey: keyPath.rawValue) }
        containerView.layer.add(animation, forKey: keyPath.rawValue)

        distanceConstraints.forEach { $0.constant = contentView.bounds.height * 0.5 - (borderViews.first?.frame.height ?? 32.0) * 0.5 }
    }
    
    /// 外框更新上下間隔動畫
    /// - Parameter duration: CFTimeInterval
    func constraintAnimation(duration: CFTimeInterval) {
        
        containerView.isHidden = false
        
        borderViews.forEach { $0.layer.transform = CATransform3DIdentity }
        distanceConstraints.forEach { $0.constant = 0 }
        
        UIViewPropertyAnimator(duration: duration, curve: .easeInOut) { [unowned self] in
            setNeedsLayout()
            layoutIfNeeded()
        }.startAnimation()
    }
    
    /// 使用animationKey來讓動畫照順序運轉
    /// - Parameters:
    ///   - anim: CAAnimation
    ///   - finished: Bool
    func animationDidStopAction(anim: CAAnimation, finished: Bool) {
        
        if animationKey == nil { return }
        
        if (finished) {
            
            animationCount += 1
            
            if (animationCount != borderViews.count) { return }
            
            switch animationKey {
            case .opacity: transformAnimation(duration: duration); animationKey = .transform
            case .transform: constraintAnimation(duration: duration); animationKey = nil
            default: animationKey = nil
            }
            
            animationCount = 0
        }
    }
    
    /// 設定背景色
    /// - Parameter backgroundColor: UIColor
    func highTechColorSetting(_ backgroundColor: UIColor) {
        containerView.backgroundColor = backgroundColor
        borderSubViews.forEach { $0.backgroundColor = backgroundColor }
    }
    
    /// 設定兩個外框最接近的距離
    func distanceConstraintsSetting() {
        distanceConstraints.forEach { $0.constant = contentView.bounds.height * 0.5 - (borderViews.first?.frame.height ?? 32.0) * 0.5 }
    }
    
    /// 修正第二次之後，外框不能設定y軸旋轉的問題 (很玄，一定要用CAAnimation)
    func fixTransformAnimation() {
        
        let keyPath: TransitionAnimationKeyPath = .transform
        let animation = CAAnimation._basicAnimation(keyPath: keyPath, delegate: nil, fromValue: transform3DRotation.start, toValue: transform3DRotation.start, duration: duration)
        
        distanceConstraintsSetting()
        borderViews.forEach { $0.layer.transform = transform3DRotation.start }
        borderViews.forEach { $0.layer.add(animation, forKey: keyPath.rawValue) }
    }
}
