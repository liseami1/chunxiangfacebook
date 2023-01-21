//
//  PostRow.swift
//  LifeLoop
//
//  Created by 赵翔宇 on 2022/11/21.
//

import SwiftUI

struct PostRow: View {
    let name: String
    let content: String
    let imagename: String
    let dateString: String
    init(name: String = "赵纯想", content: String, imagename: String, dateString: String) {
        self.name = name
        self.content = content
        self.imagename = imagename
        self.dateString = dateString
    }

    var body: some View {
        HStack(alignment: .top) {
            Image("MyAvatar_001")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 44, height: 44, alignment: .center)
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .PF_Leading()
                    .smileyFont(size: 18, color: .f1)
                Text(content)
                    .smileyFont(size: 16, color: .f2)
                Image(imagename)
                    .resizable()
                    .scaledToFit()
                    .frame(width: SCREEN_WIDTH * 0.4)
                Text(dateString)
                    .smileyFont(size: 14, color: .f2)
            }
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        PostRow(name: "", content: "", imagename: "", dateString: "")
    }
}
