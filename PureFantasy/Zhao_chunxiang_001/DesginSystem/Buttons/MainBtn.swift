//
//  MainBtn.swift
//  Looper
//
//  Created by 赵翔宇 on 2022/6/21.
//

import SwiftUI

struct MainButton: View {
    var title: String
    var btncolor: Color
    var disabled: Bool
    let action: () async -> Void
    var disableAction: () async -> Void
    var contentcolor: Color
    var height: CGFloat
    var iconname: String?
    @State private var isloading: Bool = false

    init(title: String, btncolor: Color = .MainColor, contentcolor: Color = .white, iconname: String? = nil, disabled: Bool = true, height: CGFloat = 38, disableAction: @escaping () async -> Void = {}, action: @escaping () async -> Void) {
        self.title = title
        self.btncolor = btncolor
        self.contentcolor = contentcolor
        self.action = action
        self.disabled = disabled
        self.iconname = iconname
        self.height = height
        self.disableAction = disableAction
    }

    var body: some View {
        Button {
            guard !self.isloading, disabled else {
                mada(.error)
                Task { await disableAction() }
                return
            }
            self.isloading = true
            Task {
                await action()
                DispatchQueue.main.async {
                    self.isloading = false
                }
            }
        } label: {
            HStack(spacing: 0) {
                if isloading {
                    ProgressView()
                        .tint(Color.white)
                } else {
                    if let iconname = iconname {
                        ICON(name: iconname, fcolor: contentcolor, size: 18)
                    }
                    Text(title)
                }
            }
            .lopFont(size: 17, color: contentcolor, weight: .bold)
            .addGoldenPadding()
            .frame(maxWidth: .infinity, maxHeight: height)
            .background(btncolor.opacity(disabled ? 1 : 0.3))
            .clipShape(Capsule(style: .continuous))
            .overlay(Capsule(style: .continuous)
                .stroke(lineWidth: 0.6).foregroundColor(btncolor.opacity(0.3)))
        }
        .buttonStyle(MainButtonStyle())
    }
}

struct KeyBoardTextBtn: View {
    var iconname: String?
    var emoji: String?
    var title: String
    var textColor: Color
    var disabled: Bool
    var isSelected: Bool

    let action: () -> Void

    init(iconname: String? = nil, emoji: String? = nil, title: String, textColor: Color = .MainColor, disabled: Bool = true, isSelected: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.emoji = emoji
        self.textColor = textColor
        self.disabled = disabled
        self.action = action
        self.isSelected = isSelected
        self.iconname = iconname
    }

    var body: some View {
        Button {
            guard disabled else { mada(.error); return }
            action()
        } label: {
            HStack {
                if let emoji {
                    Text(emoji)
                        .lopFont(size: 15, color: .f1)
                }
                if let iconname {
                    ICON(name: iconname)
                }
                Text(title)
                    .lopFont(size: 15, color: disabled ? textColor : .f3, weight: .medium)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .addBack(cornerRadius: 14, backGroundColor: .white, strokeLineWidth: isSelected ? 1 : 0.6, strokeFColor: isSelected ? .MainColor : .b3)
            .PF_Shadow(color: .f2.opacity(0.7), style: .s100)
        }
        .buttonStyle(MainButtonStyle())
    }
}

struct TextBtn: View {
    var title: String
    var textColor: Color
    var disabled: Bool
    let action: () async -> Void
    @State private var isloading: Bool = false
    init(title: String, textColor: Color = .MainColor, disabled: Bool = true, action: @escaping () async -> Void) {
        self.title = title
        self.textColor = textColor
        self.disabled = disabled
        self.action = action
    }

    var body: some View {
        Button {
            guard !self.isloading, disabled else { mada(.error); return }
            withAnimation(.spring()) {
                self.isloading = true
            }

            Task {
                await action()
                DispatchQueue.main.async {
                    self.isloading = false
                }
            }
        } label: {
            HStack {
                if isloading {
                    ProgressView()
                        .tint(Color.blue)
                } else {
                    Text(title)
                        .lopFont(size: 16, color: disabled ? textColor : .f3, weight: .medium)
                }
            }
        }
        .buttonStyle(MainButtonStyle())
    }
}

struct SmallBtn: View {
    var title: String
    var btncolor: Color
    var disabled: Bool
    var disabledReason: String
    let action: () async -> Void
    var contentcolor: Color
    var height: CGFloat
    var iconname: String
    var strokeColor: Color
    @State private var isloading: Bool = false

    init(title: String,
         btncolor: Color = .blue,
         contentcolor: Color = .white,
         disabled: Bool = true,
         disabledReason: String = "",
         height: CGFloat = 20,
         iconname: String = "",
         strokeColor: Color = .clear,
         action: @escaping () async -> Void)
    {
        self.iconname = iconname
        self.title = title
        self.btncolor = btncolor
        self.contentcolor = contentcolor
        self.action = action
        self.disabled = disabled
        self.height = height
        self.disabledReason = disabledReason
        self.strokeColor = strokeColor
    }

    var body: some View {
        Button {
            guard !self.isloading, disabled else {
                pushPop(disabledReason, style: .onlytext)
                mada(.error); return
            }
            self.isloading = true
            Task {
                await action()
                DispatchQueue.main.async {
                    self.isloading = false
                }
            }
        } label: {
            HStack(spacing: 0) {
                if isloading {
                    ProgressView()
                        .tint(Color.white)
                } else {
                    Text(title)
                        .lopFont(size: 15, color: contentcolor, weight: .semibold)
                        .opacity(1)
                    if !self.iconname.isEmpty {
                        ICON(name: iconname, fcolor: contentcolor, size: 16)
                    }
                }
            }
            .pf_bold(size: 15, color: contentcolor)
            .frame(minHeight: height)
            .padding(.vertical, 5)
            .padding(.horizontal, 24)
            .background(btncolor)
            .clipShape(Capsule(style: .continuous))
        }
        .buttonStyle(MainButtonStyle())
    }
}

struct MainBtn_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AddBtn(color: .MainColor) {}
            MainButton(title: "MainButton") {
                print("普通操作")
                await waitme()
            }
            MainButton(title: "MainButton", iconname: nil, disabled: false) {}
            SmallBtn(title: "SmallBtn") {}
            SmallBtn(title: "SmallBtn", disabled: false) {}
        }
    }
}

public func waitme() async {
    try? await Task.sleep(nanoseconds: 1 * NSEC_PER_SEC)
}

struct AddBtn: View {
    var action: () -> Void
    let color: Color
    init(color: Color = .MainColor, action: @escaping () -> Void) {
        self.action = action
        self.color = color
    }

    var body: some View {
        Button {
            action()
        } label: {
            ICON(sysname: "plus", fcolor: .white, fontWeight: .bold)
                .padding(.horizontal, 24)
                .padding(.vertical, 5)
                .frame(height: 44, alignment: .center)
                .addBack(cornerRadius: 32, backGroundColor: color, strokeLineWidth: 0, strokeFColor: .clear)
        }
    }
}
