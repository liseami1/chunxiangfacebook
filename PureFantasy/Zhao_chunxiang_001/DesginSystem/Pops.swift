//
//  Pops.swift
//  FantasyWindow
//
//  Created by 赵翔宇 on 2022/2/18.
//

import simd
import SwiftUI

public func pushPop(_ message: String, style: PopsStyle, alignment: Alignment = .top) {
    DispatchQueue.main.async {
        let view = FantasySwiftUIViewBox(content: PopView(.init(message: message, style: style, alignment: alignment))).view
        if let window = AppHelper().getWindow(), let view = view {
            view.size = .init(width: SCREEN_WIDTH, height: 200)
            view.backgroundColor = UIColor.clear
            view.tag = 1
            view.center = .init(x: SCREEN_WIDTH * 0.5, y: -120)
            // 默认1.6秒回收
            window.addSubview(view)
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1.2, initialSpringVelocity: 3) {
                view.center = .init(x: SCREEN_WIDTH * 0.5, y: 70)
            }
            // 默认1.6秒回收
            delayWork(2.2) {
                UIView.animate(withDuration: 0.3) {
                    view.center = .init(x: SCREEN_WIDTH * 0.5, y: -200)
                }
                delayWork(1) {
                    view.removeFromSuperview()
                }
            }
        }
    }
}

struct Pops_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PopView(PopMod(message: "这是一条这是一条通知信息，这是一条通知信息。这是一条通知信息，这是一条通知信息。这是一条通知信息，这是一条通知信息。", style: .info))
            PopView(PopMod(message: "这是一条通知信息，这是一条通知信息。", style: .success))
            PopView(PopMod(message: "这是一条通知信息，这是一条通知信息。", style: .warning))
            PopView(PopMod(message: "这是一条通知信息，这是一条通知信息。", style: .danger))
        }
    }
}

struct PopView: View {
    let pop: PopMod
    init(_ pop: PopMod) {
        self.pop = pop
    }

    var color: Color {
        pop.style.item.color
    }

    var body: some View {
        switch pop.style {
        case .onlytext: textpop
        default: bigPop
        }
    }

    var textpop: some View {
        Text(pop.message)
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .lopFont(size: 15, color: color, weight: .bold)
            .padding(.horizontal, 16)
            .frame(height: GoldenH)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .PF_Shadow(color: .f1.opacity(0.7), style: .s500)
            .padding(.top, 8)
    }

    var bigPop: some View {
        HStack(alignment: .top, spacing: 12) {
            LottieView(lottieFliesName: pop.style.item.icon, loopMode: .loop)
                .frame(width: 24, height: 24)
                .scaleEffect(1.4)
                .rotationEffect(Angle(degrees: 50))
                .offset(y: 2)
            VStack(alignment: .leading, spacing: 4) {
                Text(pop.style.item.title)
                    .pf_bold(size: 16, color: .f1)
                Text(pop.message)
                    .lineLimit(2)
                    .lopFont(size: 15, color: .f2, weight: .regular)
                    .PF_Leading()
            }
        }
        .padding(.vertical, 5)
        .pf_blurCard()
        .PF_Shadow(color: .f1.opacity(0.8), style: .s400)
        .PF_Shadow(color: .f1.opacity(0.6), style: .s700)
        .padding(.all)
        .onAppear {
            switch pop.style {
            case .success:
                mada(.success)
            case .warning:
                mada(.warning)
            case .danger:
                mada(.error)
            case .info:
                mada(.impact(.rigid))
            case .onlytext:
                mada(.impact(.soft))
            }
        }
    }
}

public enum PopsStyle {
    case success
    case warning
    case danger
    case info
    case onlytext

    var item: ItemInfo {
        switch self {
        case .success:
            return .init(title: "成功", icon: "green_bell", color: .success)
        case .warning:
            return .init(title: "警告", icon: "yellow_bell", color: .warning)
        case .danger:
            return .init(title: "错误", icon: "red_bell", color: .danger)
        case .info:
            return .init(title: "系统消息", icon: "blue_bell", color: .info)
        case .onlytext:
            return .init(title: "", icon: "", color: .f1)
        }
    }
}

public struct PopMod {
    var message: String = ""
    var style: PopsStyle = .info
    var alignment: Alignment = .bottom
}
