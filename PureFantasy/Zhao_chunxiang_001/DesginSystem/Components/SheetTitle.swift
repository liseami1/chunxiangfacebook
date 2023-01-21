//
//  SheetCapsule.swift
//  LifeLoop
//
//  Created by 赵翔宇 on 2022/9/13.
//

import SwiftUI

struct SheetTitle: View {
    let title: String
    init(title: String = "") {
        self.title = title
    }

    var body: some View {
        Text(title)
            .smileyFont(size: 20, color: .f2)
            .overlay(alignment: .bottom, content: {
                Line(color: .b2, height: 3)
                    .offset(x: 0, y: 8)
            })
    }
}

struct SheetCapsule_Previews: PreviewProvider {
    static var previews: some View {
        SheetTitle()
    }
}
