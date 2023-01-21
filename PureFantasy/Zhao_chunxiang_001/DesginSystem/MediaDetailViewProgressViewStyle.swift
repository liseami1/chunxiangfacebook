
//
//  MediaDetailViewProgressViewStyle.swift
//  FantasyChat
//
//  Created by 赵翔宇 on 2022/7/28.
//

import Foundation

struct MediaDetailViewProgressViewStyle: ProgressViewStyle {
    var color: Color
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        return
            Line(color: .b2, height: 3)
                .overlay(Line(color: color, height: 3)
                    .frame(width: SCREEN_WIDTH * fractionCompleted, height: 3, alignment: .leading)
                    .animation(.spring(), value: configuration.fractionCompleted),
                    alignment: .leading)
    }
}
