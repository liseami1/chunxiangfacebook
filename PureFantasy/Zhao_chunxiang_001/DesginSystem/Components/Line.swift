//
//  PublicComponents.swift
//  FantasyWindow
//
//  Created by 赵翔宇 on 2022/2/10.
//

import SwiftUI

struct Line: View {
    var color: Color = .b2
    var height: CGFloat = 0.6
    init(color: Color = .b2, height: CGFloat = 0.6) {
        self.color = color
        self.height = height
    }

    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(height: height)
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct PublicComponents_Previews: PreviewProvider {
    static var previews: some View {
        Line()
    }
}
