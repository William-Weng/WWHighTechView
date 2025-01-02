//
//  Constant.swift
//  WWHighTechView
//
//  Created by William.Weng on 2024/12/31.
//

import Foundation

// MARK: - 常數
public extension WWHighTechView {
    
    /// 動畫狀態
    enum Status {
        case start(_ key: TransitionAnimationKeyPath?)
        case end(_ key: TransitionAnimationKeyPath?)
    }
    
    /// [動畫路徑 (KeyPath)](https://stackoverflow.com/questions/44230796/what-is-the-full-keypath-list-for-cabasicanimation)
    enum TransitionAnimationKeyPath: String {
        case opacity = "opacity"
        case transform = "transform"
        case constraints = "constraints"
    }
}
