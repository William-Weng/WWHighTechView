//
//  Delegate.swift
//  WWHighTechView
//
//  Created by William.Weng on 2025/1/2.
//

import Foundation

// MARK: - WWHighTechViewDelegate
public protocol WWHighTechViewDelegate: AnyObject {
    
    /// HighTechView的動畫狀態
    /// - Parameters:
    ///   - highTechView: WWHighTechView
    ///   - status: WWHighTechView.Status
    func highTechView(_ highTechView: WWHighTechView, status: WWHighTechView.Status)
}
