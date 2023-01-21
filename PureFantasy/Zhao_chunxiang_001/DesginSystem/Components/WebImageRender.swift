//
//  WebImage.swift
//  FantasyChat
//
//  Created by 赵翔宇 on 2022/7/26.
//

import Kingfisher
import SwiftUI

struct WebImageRender: View {
    let str: String

    var strFix: String {
        str.replacingOccurrences(of: "alcnd.aliaochat.cn", with: "cdn.allnk.cn")
    }

    var body: some View {
        KFImage(URL(string: str))
            .resizable()
            .placeholder { _ in
                Color.b2.overlay {
                    ProgressView()
                }
            }
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
    }
}

struct WebImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WebImageRender(str: "AppConfig.mokImage!.absoluteString")
        }
    }
}
