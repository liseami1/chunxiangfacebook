//
//  Profile_001.swift
//  PureFantasy
//
//  Created by 赵翔宇 on 2023/1/19.
//

import SwiftUI



struct Profile_001_Previews: PreviewProvider {
    static var previews: some View {
        Profile_001()
    }
}


//
//  AboutMeView.swift
//  LifeLoop
//
//  Created by 赵翔宇 on 2022/11/21.
//

import SwiftUI

struct Profile_001: View {
    @State private var topCard = 1
    @State private var showWechatSheet: Bool = false
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 24) {
                    // 头像昵称
                    avatar
                    Line()
                    // 联系方式
                    content
                    PostRow(name: "赵纯想", content: "2023年春天，转山App的正式版在冈仁波齐山脚上传至App Store，转山App是世界上发布地点海拔最高的App。", imagename: "gangsrinpoche_001", dateString: "2023年3月2日")
                    Spacer()
                }
                .padding(.all, 20)
                .pf_NavigationTitle(title: "赵纯想个人主页")
                .zIndex(0)
            }
        }
    }

    var avatar: some View {
        VStack(spacing: 8) {
            Image("MyAvatar_001")
                .resizable()
                .scaledToFit()
                .frame(width: SCREEN_WIDTH * 0.27)
                .clipShape(Circle())
                .overlay(alignment: .center, content: {
                    Circle().stroke(lineWidth: 1)
                        .foregroundColor(.b2)
                })
                .PF_Shadow(color: .f2, style: .s400)
            HStack(spacing: 4) {
                Text("赵纯想")
                    .lopFont(size: 20, color: .f1, weight: .bold)
                ICON(sysname: "checkmark.seal.fill", fcolor: .blue, size: 17)
            }
            Text("“——在最高海拔发布App的多人格独立开发者。”")
                .smileyFont(size: 16, color: .f3)
        }
    }

    var content: some View {
        VStack {
            HStack {
                Button {
                    AppHelper().sendEmail()
                } label: {
                    SocialMediaLogo(logo: "envelope-outline_001", name: "发送邮件", url: "https://me.revome.cn")
                        .disabled(true)
                }
                Button {
                    Present(
                        InAppBrowser(url: .init(string: "https://me.revome.cn")!).navigationTitle("赵纯想个人网站")
                            .overlay(alignment: .topLeading, content: {
                                CloseBtn().padding(.all)
                            })
                    )
                } label: {
                    SocialMediaLogo(logo: "face-smile_001", name: "个人网站", url: "https://me.revome.cn")
                        .disabled(true)
                }
            }

            HStack {
                SocialMediaLogo(logo: "TikTok_logo_001", name: "赵纯想", url: "https://v.douyin.com/r9A8Kxu/")
                Button {
                    showWechatSheet = true
                } label: {
                    SocialMediaLogo(logo: "Wechat_logo_001", name: "私人微信", url: "")
                        .disabled(true)
                }
                .PF_Sheet_SystemSheetStyle(isPresented: $showWechatSheet, backColor: .b1) {
                    MyWeChatView()
                }
            }
        }
        .padding(.bottom, 24)
    }
}

struct SocialMediaLogo: View {
    let logo: String
    let name: String
    let url: String
    init(logo: String, name: String, url: String) {
        self.logo = logo
        self.name = name
        self.url = url
    }

    var body: some View {
        Button {
            UIApplication.shared.open(.init(string: url)!)
        } label: {
            HStack {
                Image(logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, alignment: .center)
                Text(name)
                    .smileyFont(size: 14, color: .f2)
                ICON(name: "arrow-up-right", fcolor: .f2, size: 16)
            }
            .addGoldenPadding()
            .addBack(cornerRadius: 12, backGroundColor: .b3, strokeLineWidth: 0, strokeFColor: .clear)
        }
    }
}
