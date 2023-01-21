//
//  ButtonStyles.swift
//  FantasyWindow
//
//  Created by 赵翔宇 on 2022/2/13.
//

import SwiftUI

// 主按钮
struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        configuration
            .label
            .grayscale(isPressed ? 0.2 : 0)
            .scaleEffect(isPressed ? 0.99 : 1)
    }
}

// tabbarBtn
struct MaintabbarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        let back =
            Color.b2
                .opacity(isPressed ? 0.6 : 0)
                .clipShape(Capsule(style: .continuous))
        return configuration.label.background(back)
    }
}

// ICONButtonStyle
struct ICONButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        let back = isPressed ?
            Color(uiColor: UIColor.secondarySystemBackground)
            .opacity(0.6) : Color.white.opacity(0.00001)
        return configuration.label
            .background(back)
            .scaleEffect(isPressed ? 0.99 : 1)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

// FloderOperationButtonStyle
struct FloderOperationButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        let back = isPressed ?
            Color(uiColor: UIColor.secondarySystemBackground)
            .opacity(0.6) : Color.white.opacity(0.00001)
        return configuration.label
            .scaleEffect(isPressed ? 0.99 : 1)
            .padding(.all, isPressed ? 2 : 0)
            .background(back)
            .clipShape(RoundedRectangle(cornerRadius: isPressed ? 8 : 0, style: .continuous))
    }
}

struct FantasyListUserLineButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        let back = (isPressed ?
            Color.b2 : Color.white.opacity(0.00001))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        return configuration.label
            .frame(height: 47)
            .padding(.horizontal, 8)
            .padding(.vertical, 12)
            .background(back)
            .padding(.horizontal, 4)
            .scaleEffect(isPressed ? 0.99 : 1)
    }
}

struct FantasyListButtonButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        let back = Color.clear
            .addBack(cornerRadius: 16, backGroundColor: isPressed ? .b2 : .white, strokeLineWidth: 0.6, strokeFColor: .b3.opacity(0.5))
        return configuration.label
            .frame(height: 47)
            .addGoldenPadding()
            .background(back)
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .scaleEffect(isPressed ? 0.99 : 1)
    }
}

// FloderOperationButtonStyle
struct ListSubRowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        let back = isPressed ?
            Color(uiColor: UIColor.secondarySystemBackground)
            .opacity(0.6) : Color.white.opacity(0.00001)
        return configuration.label
            .frame(height: 32)
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .scaleEffect(isPressed ? 0.99 : 1)
            .background(back)
            .clipShape(RoundedRectangle(cornerRadius: isPressed ? 8 : 0, style: .continuous))
    }
}

struct FantasyCanBeSelectedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        let back = (isPressed ?
            Color.b2 : Color.white.opacity(0.00001))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        return configuration.label
            .padding(.all, 4)
            .background(back)
            .padding(.horizontal, 4)
            .scaleEffect(isPressed ? 0.99 : 1)
    }
}

struct FantasyLabelButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        return configuration.label
            .addGoldenPadding()
            .addBack(cornerRadius: 16, backGroundColor: isPressed ? .b2 : .b1, strokeLineWidth: isPressed ? 0 : 0.5, strokeFColor: .b2)
            .scaleEffect(isPressed ? 0.99 : 1)
    }
}

struct FantasyToggleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
