//
//  MyWeChatView.swift
//  LifeLoop
//
//  Created by 赵翔宇 on 2023/1/5.
//

import SwiftUI

struct MyWeChatView: View {
    var body: some View {
        VStack {
            Image("mywechatview")
                .resizable()
                .frame(width: SCREEN_WIDTH * 0.6, height: SCREEN_WIDTH * 0.6, alignment: .center)
            VStack(spacing: 12) {
                Text("有一个紧迫的话题？")
                    .pf_bold(size: 20, color: .f1)
                Text("希望你能够想要说的话，然后再添加微信。好友位置比较局促，所以仅限于紧急的联系。希望你能理解这一点，然后点击下方的按钮。")
                    .lopFont(size: 15, color: .f2)
            }
            .padding(.bottom, 60)
            MainButton(title: "点击复制微信号", btncolor: .f1, contentcolor: .white, height: 48) {
                UIPasteboard.general.string = "zhaochunxiang1109"
                pushPop("微信号已复制到你的剪贴板。", style: .onlytext)
            }
        }
        .padding(.all, 32)
    }
}

struct MyWeChatView_Previews: PreviewProvider {
    static var previews: some View {
        MyWeChatView()
            .isPreview(.sheet)
    }
}
