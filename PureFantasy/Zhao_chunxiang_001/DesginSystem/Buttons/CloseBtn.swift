//
//  CloseBtn.swift
//  FantasyChat
//
//  Created by 赵翔宇 on 2022/8/25.
//

import SwiftUI

struct CloseBtn: View {
    let action: () -> ()

    init(action: @escaping () -> () = { CloseSheet() }) {
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            ICON(sysname: "xmark", fcolor: .f2, size: 10, fontWeight: .bold)
                .padding(.all, 4)
                .background(Circle().fill(Color.b1))
        }
        .buttonStyle(ICONButtonStyle())
    }
}

struct CloseBtnViewModifier: ViewModifier {
    let placement: ToolbarItemPlacement
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: placement) {
                    Button {
                        CloseSheet()
                    } label: {
                        ICON(name: "X", size: 16)
                            .background(Circle().fill(Color.b2))
                    }
                    .buttonStyle(ICONButtonStyle())
                }
            }
    }
}

extension View {
    func addCloseBtn(placement: ToolbarItemPlacement) -> some View {
        self.modifier(CloseBtnViewModifier(placement: placement))
    }
}

struct CloseBtn_Previews: PreviewProvider {
    static var previews: some View {
        CloseBtn()
    }
}
