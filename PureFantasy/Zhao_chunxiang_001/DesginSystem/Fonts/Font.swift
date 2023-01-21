//
//  Font.swift
//  Looper
//
//  Created by 赵翔宇 on 2022/6/19.
//

struct NumberFont: ViewModifier {
    let size: CGFloat
    let color: Color
    func body(content: Content) -> some View {
        content
            .font(.custom("Mitr Medium", size: size))
            .foregroundColor(color)
    }
}

struct PFBoldFontModifier: ViewModifier {
    let size: CGFloat
    let color: Color
    init(size: CGFloat, color: Color) {
        self.size = size
        self.color = color
    }

    func body(content: Content) -> some View {
        if let font = UIFont(name: "Noto Sans SC Bold", size: size) {
            return content.font(Font(font))
                .foregroundColor(color)
        } else {
            return content.font(.system(size: size, weight: .black, design: .default))
                .foregroundColor(color)
        }
    }
}

struct LoopFont: ViewModifier {
    let size: CGFloat
    let color: Color
    var weight: Font.Weight = .regular
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: .rounded))
            .foregroundColor(color)
    }
}

struct SmileyFont: ViewModifier {
    let size: CGFloat
    let color: Color
    func body(content: Content) -> some View {
        content
            .font(.custom("SmileySans-Oblique", size: size))
            .foregroundColor(color)
    }
}

extension View {
    func isNumber(size: CGFloat, color: Color = .f1) -> some View {
        modifier(NumberFont(size: size, color: color))
    }

    func smileyFont(size: CGFloat, color: Color = .f1) -> some View {
        modifier(SmileyFont(size: size, color: color))
    }

    func lopFont(size: CGFloat, color: Color, weight: Font.Weight = .regular) -> some View {
        modifier(LoopFont(size: size, color: color, weight: weight))
    }

    func pf_bold(size: CGFloat, color: Color) -> some View {
        modifier(PFBoldFontModifier(size: size, color: color))
    }
}
