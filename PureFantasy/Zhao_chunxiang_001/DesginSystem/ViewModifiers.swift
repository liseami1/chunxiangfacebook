//
//  ViewMod.swift
//  FantasyUI
//
//  Created by Liseami on 2021/11/20.
//

import SwiftUI

/**
 调整按钮位置至屏幕角落
 */

public struct PF_MovotoModifier: ViewModifier {
    public enum edge {
        case centerLeading
        case centerTrailing
        case topCenter
        case bottomCenter
        case topLeading
        case topTrailing
        case bottomLeading
        case bottomTrailing
    }

    var WhereMoveTo: edge
    public func body(content: Content) -> some View {
        switch WhereMoveTo {
        case .centerLeading:
            HStack(alignment: .center) { content; Spacer() }
        case .centerTrailing:
            HStack(alignment: .center) { Spacer(); content }
        case .topCenter:
            VStack { content; Spacer() }
        case .bottomCenter:
            VStack { Spacer(); content }
        case .topLeading:
            VStack { HStack { content; Spacer() }; Spacer() }
        case .topTrailing:
            VStack { HStack { Spacer(); content }; Spacer() }
        case .bottomLeading:
            VStack { Spacer(); HStack { content; Spacer() }}
        case .bottomTrailing:
            VStack { Spacer(); HStack { Spacer(); content }}
        }
    }
}

extension View {
    func MoveTo(_ edge: PF_MovotoModifier.edge) -> some View {
        modifier(PF_MovotoModifier(WhereMoveTo: edge))
    }
}

extension View {
    func PF_Shadow(color: Color = .black, style: PF_ShadowMod.Style = .s800) -> some View {
        modifier(PF_ShadowMod(color: color, style: style))
    }
}

/**
 阴影
  */
public struct PF_ShadowMod: ViewModifier {
    let color: Color
    var style: Style = .s100
    public enum Style {
        case s100, s200, s300, s400, s500, s600, s700, s800
    }

    public func body(content: Content) -> some View {
        switch style {
        case .s100:
            content
                .shadow(color: color.opacity(0.12), radius: 4, x: 0, y: 2)
                .shadow(color: color.opacity(0.08), radius: 4, x: 0, y: 4)
        case .s200:
            content
                .shadow(color: color.opacity(0.12), radius: 6, x: 0, y: 4)
                .shadow(color: color.opacity(0.08), radius: 8, x: 0, y: 8)
        case .s300:
            content
                .shadow(color: color.opacity(0.12), radius: 8, x: 0, y: 6)
                .shadow(color: color.opacity(0.08), radius: 16, x: 0, y: 8)
        case .s400:
            content
                .shadow(color: color.opacity(0.12), radius: 12, x: 0, y: 6)
                .shadow(color: color.opacity(0.08), radius: 24, x: 0, y: 8)
        case .s500:
            content
                .shadow(color: color.opacity(0.12), radius: 14, x: 0, y: 6)
                .shadow(color: color.opacity(0.08), radius: 32, x: 0, y: 10)
        case .s600:
            content
                .shadow(color: color.opacity(0.12), radius: 18, x: 0, y: 8)
                .shadow(color: color.opacity(0.08), radius: 42, x: 0, y: 12)
        case .s700:
            content
                .shadow(color: color.opacity(0.12), radius: 22, x: 0, y: 8)
                .shadow(color: color.opacity(0.08), radius: 64, x: 0, y: 14)
        case .s800:
            content
                .shadow(color: color.opacity(0.12), radius: 22, x: 0, y: 8)
                .shadow(color: color.opacity(0.08), radius: 88, x: 0, y: 18)
        }
    }
}

/**
 SheetCard
  */
extension View {
    func isSheetCard() -> some View {
        modifier(SheetCard())
    }
}

struct SheetCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 16)
            .background(Color.b1.opacity(0.98))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .PF_Shadow(color: .f1.opacity(0.8), style: .s200)
            .padding(.all, 12)
    }
}

struct SheetLine: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 12)
            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(lineWidth: 1).foregroundColor(.l1))
    }
}

/**
 TostaCard
  */
extension View {
    func isTostaCard() -> some View {
        modifier(TostaCard())
    }
}

struct TostaCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 12)
            .background(Color.b1.opacity(0.98))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .PF_Shadow(color: .f1.opacity(0.8), style: .s200)
            .PF_Shadow(color: .f1.opacity(0.6), style: .s700)
            .padding(.all, SCREEN_WIDTH * ((1 - 0.618) * 0.618 / 2))
    }
}

/**
 Tag
  */
struct TagInCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .background(Color.b2.opacity(0.6)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
    }
}

extension View {
    func isTagInCard() -> some View {
        modifier(TagInCard())
    }
}

/**
 添加边框
  */
struct ViewStroke: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 12)
            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(lineWidth: 1).foregroundColor(.l1))
    }
}

extension View {
    func addViewStroke() -> some View {
        modifier(ViewStroke())
    }
}

/**
 滑动选中
 */
extension View {
    func addSelectedGesture(selected: Bool, canbetap: Bool, selectedAction: @escaping () -> ()) -> some View {
        modifier(SelectedGesture(selected: selected, canbetap: canbetap, selectedAction: selectedAction))
    }
}

struct SelectedGesture: ViewModifier {
    var selected: Bool
    var canbetap: Bool
    var cornerRadius: CGFloat
    var selectedAction: () -> ()
    init(selected: Bool, canbetap: Bool, cornerRadius: CGFloat = 12, selectedAction: @escaping () -> ()) {
        self.selected = selected
        self.canbetap = canbetap
        self.cornerRadius = cornerRadius
        self.selectedAction = selectedAction
    }

    @GestureState var dragOffsetX: CGFloat = 0
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.blue)
                    .ifshow(selected))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(Color.blue.opacity(0.1)).ifshow(selected), alignment: .center)
            .offset(x: dragOffsetX)
            .animation(.PFSpring, value: dragOffsetX)
            .gesture(gesture)
            .onTapGesture {
                guard canbetap else { return }
                selectedAction()
            }
    }

    var gesture: _EndedGesture<GestureStateGesture<DragGesture, CGFloat>> {
        DragGesture(minimumDistance: 24, coordinateSpace: .global)
            .updating($dragOffsetX) { value, out, _ in
                let xmove = value.translation.width
                out = xmove
            }
            .onEnded { value in
                let x = abs(value.translation.width)
                if x >= 66 {
                    mada(.impact(.rigid))
                    selectedAction()
                }
            }
    }
}

/**
 文字标签
 */
extension View {
    func isTextTag(_ color: Color = .black) -> some View {
        modifier(TextTag(color))
    }
}

struct TextTag: ViewModifier {
    let color: Color
    init(_ color: Color = .MainColor) {
        self.color = color
    }

    func body(content: Content) -> some View {
        content
            .pf_bold(size: 15, color: color)
            .padding(.vertical, 2)
            .padding(.horizontal, 8)
            .background(color.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

/**
 快捷添加背景色、裁剪角度、边线
 */
struct BackgroundWithCornerRadiusAndStroke: ViewModifier {
    var cornerRadius: CGFloat
    var backGroundColor: Color
    var strokeLineWidth: CGFloat
    var strokeFColor: Color

    init(cornerRadius: CGFloat = 12, backGroundColor: Color = .white, strokeLineWidth: CGFloat = 1, strokeFColor: Color = .clear) {
        self.cornerRadius = cornerRadius
        self.backGroundColor = backGroundColor
        self.strokeLineWidth = strokeLineWidth
        self.strokeFColor = strokeFColor
    }

    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        return content
            .background(backGroundColor)
            .clipShape(shape)
            .overlay(alignment: .center) {
                shape.stroke(lineWidth: strokeLineWidth)
                    .foregroundColor(strokeFColor)
            }
    }
}

extension View {
    func addBack(cornerRadius: CGFloat = 12, backGroundColor: Color = .white, strokeLineWidth: CGFloat = 1, strokeFColor: Color = .clear) -> some View {
        modifier(BackgroundWithCornerRadiusAndStroke(cornerRadius: cornerRadius, backGroundColor: backGroundColor, strokeLineWidth: strokeLineWidth, strokeFColor: strokeFColor))
    }
}

/**
 视图触摸回调
 */
struct OnTouch: ViewModifier {
    var onTouch: () -> ()
    init(onTouch: @escaping () -> ()) {
        self.onTouch = onTouch
    }

    func body(content: Content) -> some View {
        let gusture = DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { _ in
                withAnimation(.PFSpring) {
                    onTouch()
                }
            }
        content
            .gesture(gusture)
    }
}

extension View {
    func onTouch(onTouch: @escaping () -> ()) -> some View {
        modifier(OnTouch(onTouch: onTouch))
    }
}

/**
 黄金边距
 */
struct GoldenPadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 16 * 0.618)
    }
}

extension View {
    func addGoldenPadding() -> some View {
        modifier(GoldenPadding())
    }
}

/**
 FantasyLabel，性感的标签
 */
struct isFantasyLabelViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .addGoldenPadding()
            .addBack(cornerRadius: 12, backGroundColor: .b1, strokeLineWidth: 0.6, strokeFColor: .b2)
    }
}

extension View {
    func isFantasyLabel() -> some View {
        modifier(isFantasyLabelViewModifier())
    }
}

/**
 isFantasyTextField 性感的输入框
 */
struct isFantasyTextFieldViewModifier: ViewModifier {
    var color: Color
    init(color: Color = .event_yellow) {
        self.color = color
    }

    func body(content: Content) -> some View {
        content
            .frame(height: 32)
            .lopFont(size: 17, color: .f1, weight: .bold)
            .addGoldenPadding()
            .addBack(cornerRadius: 9, backGroundColor: color, strokeLineWidth: 0.6, strokeFColor: color.opacity(0.6))
    }
}

extension View {
    func isFantasyTextField(color: Color = .event_yellow) -> some View {
        modifier(isFantasyTextFieldViewModifier(color: color))
    }
}

/**
 isFantasyTextEditor，性感Editor
 */
struct isFantasyTextEditorViewModifier: ViewModifier {
    var color: Color
    init(color: Color = .event_yellow) {
        self.color = color
    }

    func body(content: Content) -> some View {
        content
            .lopFont(size: 17, color: .f1, weight: .bold)
            .addGoldenPadding()
            .addBack(cornerRadius: 9, backGroundColor: color, strokeLineWidth: 0.6, strokeFColor: color.opacity(0.6))
    }
}

extension View {
    func isFantasyTextEditor(color: Color = .event_yellow) -> some View {
        modifier(isFantasyTextEditorViewModifier(color: color))
    }
}

/**
 Placeholder...
 */

struct isFantasyPlaceHolderViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 100)
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowSeparator(.hidden)
    }
}

extension View {
    func isFantasyPlaceHolder() -> some View {
        modifier(isFantasyPlaceHolderViewModifier())
    }
}

/*
 Image in Post ...
 */

struct PostImageAreaViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .addBack(cornerRadius: 12, backGroundColor: .clear, strokeLineWidth: 0.6, strokeFColor: .b3)
    }
}

extension View {
    func isPostImageArea() -> some View {
        modifier(PostImageAreaViewModifier())
    }
}

// UserLineList...
struct FantasyListUserLineViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            //            // ▼ ListRow设置...
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            //            // ▼ 按钮风格...
            .buttonStyle(FantasyListUserLineButtonStyle())
    }
}

extension View {
    func isFantasyListUserLine() -> some View {
        modifier(FantasyListUserLineViewModifier())
    }
}

struct FantasyListButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            //            // ▼ ListRow设置...
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            //            // ▼ 按钮风格...
            .buttonStyle(FantasyListButtonButtonStyle())
    }
}

extension View {
    func isFantasyListButton() -> some View {
        modifier(FantasyListButtonViewModifier())
    }
}

struct SearchBtnModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .submitLabel(.search)
            .PF_Leading()
            .frame(height: 28)
            .addGoldenPadding()
            .addBack(cornerRadius: 15, backGroundColor: .b1, strokeLineWidth: 1.2, strokeFColor: .b2)
    }
}

extension View {
    func isSearchBtn() -> some View {
        modifier(SearchBtnModifier())
    }
}

/*
 LoadingBlur
 */

struct LoadingBlurLayer: ViewModifier {
    var loading: Bool
    func body(content: Content) -> some View {
        content
            .overlay(Color.white.opacity(0.01).ignoresSafeArea().ifshow(loading))
            .blur(radius: loading ? 7 : 0)
            .overlay(ProgressView().ifshow(loading))
    }
}

extension View {
    func addLoadingBlurLayer(loading: Bool) -> some View {
        modifier(LoadingBlurLayer(loading: loading))
    }
}

/*
 可选择视图..
 */

extension View {
    ///
    /// - Parameters:
    ///   - arr: 选择arr
    ///   - value: 当前值
    ///   - isEditMod: 编辑模式
    func canBeSelected<Value>(arr: Binding<[Value]>, value: Value, isEditMod: Bool) -> some View where Value: Hashable {
        modifier(CanBeSelected(arr: arr, value: value, isEditMod: isEditMod))
    }
}

struct CanBeSelected<Value>: ViewModifier where Value: Hashable {
    @Binding var arr: [Value]
    var value: Value
    var isEditMod: Bool

    init(arr: Binding<[Value]>, value: Value, isEditMod: Bool) {
        self._arr = arr
        self.value = value
        self.isEditMod = isEditMod
    }

    func body(content: Content) -> some View {
        if isEditMod {
            let selected = arr.contains(value)
            Button {
                withAnimation(.spring()) {
                    if selected {
                        arr.removeAll(value)
                    } else {
                        arr.append(value)
                    }
                }
            } label: {
                HStack {
                    Circle()
                        .stroke(lineWidth: 1).foregroundColor(selected ? .MainColor.opacity(0.5) : .b3)
                        .frame(width: 24, height: 24)
                        .overlay {
                            Circle().foregroundColor(.MainColor)
                                .frame(width: 20, height: 20)
                                .transition(.opacity.combined(with: .scale))
                                .ifshow(selected)
                        }
                    content.disabled(true)
                }
                .padding(.leading, 12)
            }
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .buttonStyle(FantasyCanBeSelectedButtonStyle())
        } else {
            content
        }
    }
}

struct ShimmeringView<Content: View>: View {
    private let content: () -> Content
    private let configuration: ShimmerConfiguration
    @State private var startPoint: UnitPoint
    @State private var endPoint: UnitPoint
    init(configuration: ShimmerConfiguration, @ViewBuilder content: @escaping () -> Content) {
        self.configuration = configuration
        self.content = content
        _startPoint = .init(wrappedValue: configuration.initialLocation.start)
        _endPoint = .init(wrappedValue: configuration.initialLocation.end)
    }

    var body: some View {
        content()
            .overlay(
                LinearGradient(
                    gradient: configuration.gradient,
                    startPoint: startPoint,
                    endPoint: endPoint
                )
                .opacity(configuration.opacity)
                .blendMode(.screen)
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(Animation.linear(duration: configuration.duration).repeatForever(autoreverses: false)) {
                            startPoint = configuration.finalLocation.start
                            endPoint = configuration.finalLocation.end
                        }
                    }
                })
            )
    }
}

public struct ShimmerModifier: ViewModifier {
    let configuration: ShimmerConfiguration
    public func body(content: Content) -> some View {
        ShimmeringView(configuration: configuration) { content }
    }
}

public class ShimmerConfiguration {
    var gradient: Gradient
    var initialLocation: (start: UnitPoint, end: UnitPoint)
    var finalLocation: (start: UnitPoint, end: UnitPoint)
    var duration: TimeInterval
    var opacity: Double
    init(gradient: Gradient, initialLocation: (start: UnitPoint, end: UnitPoint), finalLocation: (start: UnitPoint, end: UnitPoint), duration: TimeInterval, opacity: Double) {
        self.gradient = gradient
        self.initialLocation = initialLocation
        self.finalLocation = finalLocation
        self.duration = duration
        self.opacity = opacity
    }
}

public extension View {
    func shimmer() -> some View {
        let c = ShimmerConfiguration(
            gradient: Gradient(stops: [
                .init(color: .black, location: 0),
                .init(color: .white, location: 0.3),
                .init(color: .white, location: 0.7),
                .init(color: .black, location: 1),
            ]),
            initialLocation: (start: UnitPoint(x: -1, y: 0.5), end: .leading),
            finalLocation: (start: .trailing, end: UnitPoint(x: 2, y: 0.5)),
            duration: 0.7,
            opacity: 0.5
        )
        return modifier(ShimmerModifier(configuration: c))
    }
}

struct PFCornerRadius: ViewModifier {
    let size: CGFloat?
    var cornerRadius: CGFloat {
        if let size = size {
            return size / 80 * 34
        } else {
            return 12
        }
    }

    func body(content: Content) -> some View {
        if let size = size {
            content
                .frame(width: size, height: size, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous), style: .init())
                .addBack(cornerRadius: cornerRadius, backGroundColor: .event_yellow, strokeLineWidth: 0.6, strokeFColor: .b3)
        } else {
            content
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous), style: .init())
                .addBack(cornerRadius: cornerRadius, backGroundColor: .event_yellow, strokeLineWidth: 0.6, strokeFColor: .b3)
        }
    }
}

public extension View {
    func addPFCornerRadius(size: CGFloat? = nil) -> some View {
        modifier(PFCornerRadius(size: size))
    }
}

struct LoadMoreViewModifier: ViewModifier {
    var islast: Bool
    @State var isLoadingMore: Bool = false
    @State var offset: CGFloat = 0
    @State var loadingStatus: loadingMoreStatus = .canLoadingMore {
        didSet {
            if loadingStatus == .needCoolDown { DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.PFSpring) {
                    self.loadingStatus = .canLoadingMore
                }
            } }
        }
    }

    var loadMoreTask: () async -> ()
    enum loadingMoreStatus {
        case isLoadingMore
        case needCoolDown
        case canLoadingMore
    }

    func body(content: Content) -> some View {
        if islast {
            content
                .background(GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self, value: -$0.frame(in: .global).maxY)
                })
                .onPreferenceChange(ViewOffsetKey.self) { offset in
                    DispatchQueue.main.async {
                        self.offset = SCREEN_HEIGHT + offset
                    }
                }
                .overlay(alignment: .bottom, content: {
                    ProgressView()
                        .offset(x: 0, y: 44)
                        .ifshow(self.loadingStatus != .canLoadingMore)
                })
                .padding(.bottom, loadingStatus == .isLoadingMore ? 70 : 0)
                .onChange(of: offset) { newValue in
                    // 满足刷新距离
                    if newValue > 100, self.loadingStatus == .canLoadingMore {
                        withAnimation(.PFSpring) {
                            self.loadingStatus = .isLoadingMore
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            Task {
                                await self.loadMoreTask()
                                withAnimation(.PFSpring) {
                                    self.loadingStatus = .needCoolDown
                                }
                            }
                        }
                    }
                }
        } else {
            content
        }
    }
}

public extension View {
    func onLoadMore(islast: Bool, loadMoreTask: @escaping () async -> ()) -> some View {
        modifier(LoadMoreViewModifier(islast: islast, loadMoreTask: loadMoreTask))
    }
}

struct TopOneOffsetViewMode: ViewModifier {
    var isFrist: Bool
    var offsetOutput: (CGFloat) -> ()
    init(isFrist: Bool, offsetOutput: @escaping (CGFloat) -> ()) {
        self.isFrist = isFrist
        self.offsetOutput = offsetOutput
    }

    func body(content: Content) -> some View {
        if isFrist {
            content
                .background(GeometryReader(content: { GeometryProxy in
                    Color.clear
                        .preference(key: ViewOffsetKey.self, value: GeometryProxy.frame(in: .global).minY)
                }))
                // 向Vm上报，ViewOffset...
                .onPreferenceChange(ViewOffsetKey.self) { offset in
                    DispatchQueue.main.async {
                        offsetOutput(offset)
                    }
                }
        } else {
            content
        }
    }
}

public extension View {
    func getFirstOffset(isFrist: Bool, offsetOutput: @escaping (CGFloat) -> ()) -> some View {
        modifier(TopOneOffsetViewMode(isFrist: isFrist, offsetOutput: offsetOutput))
    }
}

//
// struct EventCardTag: View {
//    var icon: String
//    var text: String
//    var isEditing: Bool
//    var editingColor: Color
//    init(isEditing: Bool, text: String, icon: String, editingColor: Color) {
//        self.isEditing = isEditing
//        self.text = text
//        self.icon = icon
//        self.editingColor = editingColor
//    }
//
//    var body: some View {
//        HStack(spacing: 6) {
//            ICON(name: icon, fcolor: isEditing ? editingColor .f1, size: 20)
//            Text(text)
//                .lopFont(size: 16, color: .f2, weight: .bold)
//        }
//        .isEventCardTag(isEditing: isEditing, editingColor: editingColor)
//    }
// }

struct EventCardTagViewModifier: ViewModifier {
    var isEditing: Bool = false
    var editingColor: Color = .MainColor
    let action: () -> ()
    func body(content: Content) -> some View {
        Button {
            action()
        } label: {
            content
                .lopFont(size: 16, color: isEditing ? editingColor.opacity(0.9) : .f2, weight: .bold)
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
                .addBack(cornerRadius: 17, backGroundColor: isEditing ? editingColor.opacity(0.17) : .b1, strokeLineWidth: isEditing ? 2 : 0, strokeFColor: isEditing ? editingColor : .clear)
        }
    }
}

public extension View {
    func isEventCardTag(isEditing: Bool = false, editingColor: Color = .MainColor, action: @escaping () -> () = {}) -> some View {
        modifier(EventCardTagViewModifier(isEditing: isEditing, editingColor: editingColor, action: action))
    }
}

struct ViewModifiers_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack(spacing: 6) {
                ICON(name: "briefcase", fcolor: .f1, size: 20)
                Text("物品提醒 [0]")
            }
            .isEventCardTag {}

            HStack(spacing: 6) {
                ICON(name: "briefcase", fcolor: .MainColor, size: 20)
                Text("物品提醒 [0]")
            }
            .isEventCardTag(isEditing: true, editingColor: .MainColor) {}
        }
    }
}

struct PFNavigationTitle: ViewModifier {
    let title: String
    init(title: String) {
        self.title = title
    }

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    SheetTitle(title: title)
                }
            }
    }
}

extension View {
    func pf_NavigationTitle(title: String) -> some View {
        modifier(PFNavigationTitle(title: title))
    }
}

struct BlurCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .addGoldenPadding()
            .background(BlurView(colorSheme: .light))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(alignment: .center, content: {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.b2)
            })
    }
}

extension View {
    func pf_blurCard() -> some View {
        modifier(BlurCard())
    }
}
