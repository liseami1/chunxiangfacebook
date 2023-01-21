//
//  FantasyListBtn.swift
//  FantasyChat
//
//  Created by 赵翔宇 on 2022/7/24.
//

import SwiftUI

struct listBtn: View {
    var itmeinfo: ItemInfo
    var action: () -> Void
    var badge: Int = 0
    init(itmeinfo: ItemInfo, badge: Int = 0, action: @escaping () -> Void) {
        self.action = action
        self.itmeinfo = itmeinfo
        self.badge = badge
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
//                if #available(iOS 16.0, *) {
//                    Color.clear
//                        .frame(width: 27, height: 27, alignment: .center)
//                        .background(itmeinfo.color)
//                        .mask {
//                            Image(itmeinfo.icon)
//                                .resizable()
//                                .renderingMode(.template)
//                                .foregroundColor(itmeinfo.color)
//                                .scaledToFit()
//                                .frame(height: 27, alignment: .center)
//                        }
//
//                } else {
                    LinearGradient(gradient: Gradient(colors: [itmeinfo.color.opacity(0.6), itmeinfo.color]), startPoint: .top, endPoint: .bottom)
                        .frame(width: 27, height: 27, alignment: .center)
                        .mask {
                            Image(itmeinfo.icon)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(itmeinfo.color)
                                .scaledToFit()
                                .frame(height: 27, alignment: .center)
                        }
//                }

                Text(itmeinfo.title)
                    .lopFont(size: 16, color: .f1, weight: .bold)
                    .PF_Leading()
                Spacer()
                Text("\(badge)")
                    .lopFont(size: 15, color: .b1, weight: .bold)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .addBack(cornerRadius: 12, backGroundColor: .MainColor, strokeLineWidth: 0, strokeFColor: .clear)
                    .ifshow(badge > 0)
                FantasyRight()
            }
        }
        .isFantasyListButton()
    }
}

struct FantasyListBtn_Previews: PreviewProvider {
    static var previews: some View {
        listBtn(itmeinfo: .init(title: "Hello，world", icon: "X", color: .red)) {}
    }
}
