//
//  Extension.swift
//  WWHighTechView
//
//  Created by William.Weng on 2024/12/31.
//

import UIKit

// MARK: - CAAnimation (static function)
extension CAAnimation {
    
    /// [Layer動畫產生器 (CABasicAnimation)](https://jjeremy-xue.medium.com/swift-說說-cabasicanimation-9be31ee3eae0)
    /// - Parameters:
    ///   - keyPath: [要產生的動畫key值](https://blog.csdn.net/iosevanhuang/article/details/14488239)
    ///   - delegate: [CAAnimationDelegate?](https://juejin.cn/post/6936070813648945165)
    ///   - fromValue: 開始的值
    ///   - toValue: 結束的值
    ///   - duration: 動畫時間
    ///   - repeatCount: 播放次數
    ///   - fillMode: [CAMediaTimingFillMode](https://juejin.cn/post/6991371790245183496)
    ///   - timingFunction: CAMediaTimingFunction?
    ///   - isRemovedOnCompletion: Bool
    /// - Returns: Constant.CAAnimationInformation
    static func _basicAnimation(keyPath: WWHighTechView.TransitionAnimationKeyPath, delegate: CAAnimationDelegate? = nil, fromValue: Any?, toValue: Any?, duration: CFTimeInterval = 5.0, repeatCount: Float = 1.0, fillMode: CAMediaTimingFillMode = .forwards, timingFunction: CAMediaTimingFunction? = nil, isRemovedOnCompletion: Bool = false) -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: keyPath.rawValue)
        
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.fillMode = fillMode
        animation.isRemovedOnCompletion = isRemovedOnCompletion
        animation.delegate = delegate
        animation.timingFunction = timingFunction
        
        return animation
    }
}

// MARK: - UIView (function)
extension UIView {
    
    /// [設定LayoutConstraint => 不能加frame](https://zonble.gitbooks.io/kkbox-ios-dev/content/autolayout/intrinsic_content_size.html)
    /// - Parameter view: [要設定的View](https://www.appcoda.com.tw/auto-layout-programmatically/)
    func _autolayout(on view: UIView) {
        
        removeFromSuperview()
        view.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
