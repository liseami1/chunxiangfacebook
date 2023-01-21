//
//  NotificationNames.swift
//  FantasyChat
//
//  Created by 赵翔宇 on 2022/8/18.
//

import Foundation

public extension Notification.Name {
    /// 专注提交
    static let FocusCommited =
        Notification.Name("com.fantasy.easydao.FocusCommited")
    /// 专注开始
    static let FocusStarted =
        Notification.Name("com.fantasy.easydao.FocusStarted")

    static let EventEditedSuccess =
        Notification.Name("com.fantasy.easydao.EventEditedSuccess")
}
