//
//  HomeViewModel.swift
//  PureFantasy
//
//  Created by 赵翔宇 on 2023/1/19.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    enum Members: CaseIterable {
        case zhao_chunxiang
        case zhao_chunxiang_2

        var icon: String {
            switch self {
            case .zhao_chunxiang: return ""
            case .zhao_chunxiang_2 : return ""
            }
        }

        var name: String {
            switch self {
            case .zhao_chunxiang: return "赵纯想的个人主页"
            case .zhao_chunxiang_2 : return "赵纯想小号的个人主页"
            }
        }

        var profile: AnyView {
            switch self {
            case .zhao_chunxiang: return AnyView(Profile_001())
            case .zhao_chunxiang_2 : return AnyView(Profile_002())
            }
        }
    }
}
