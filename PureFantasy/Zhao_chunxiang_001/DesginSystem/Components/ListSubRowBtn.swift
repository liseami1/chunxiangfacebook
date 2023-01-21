//
//  ListSubRow.swift
//  FantasyChat
//
//  Created by 赵翔宇 on 2022/7/25.
//

import SwiftUI

struct ListSubRow: View {
    let item: SettingItemInfo
    var toggleState: Bool?

    init(_ item: SettingItemInfo, toggle: Bool? = nil) {
        self.item = item
        self.toggleState = toggle
    }

    var body: some View {
        HStack(spacing: 12) {
            ICON(name: item.left.icon)
                .ifshow(!item.left.icon.isEmpty)
            Text(item.left.title)
                .pf_bold(size: 17, color: .f1)
                .PF_Leading()
            Spacer()
            if let bindingToggle = toggleState {
                FantasyToggle(isOn: .constant(bindingToggle))
                    .buttonStyle(FantasyToggleButtonStyle())
                    .disabled(true)
                    .padding(.trailing, 12)
            } else {
                HStack(spacing: 0) {
                    Text(item.right.title)
                        .lineLimit(1)
                        .lopFont(size: 16, color: .f2, weight: .regular)
                        .ifshow(!item.right.title.isEmpty)
                    ICON(name: item.right.icon, fcolor: .f3)
                        .ifshow(!item.right.icon.isEmpty)
                    FantasyRight()
                }
            }
        }
        .listRowInsets(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
        .listRowSeparator(.hidden)
    }
}

struct ListSubRowBtn: View {
    let item: SettingItemInfo
    var toggleState: Bool?
    let action: () -> Void
//    let toggle :
    init(_ item: SettingItemInfo, toggle: Bool? = nil, action: @escaping () -> Void) {
        self.item = item
        self.toggleState = toggle
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            ListSubRow(item, toggle: toggleState)
        }
        .listRowInsets(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
        .listRowSeparator(.hidden)
        .buttonStyle(ListSubRowButtonStyle())
    }
}

struct ListSubRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(0 ... 12, id: \.self) { _ in
                ListSubRowBtn(.init(left: .init(title: "left"))) {}
                ListSubRowBtn(.init(left: .init(title: "right")), toggle: Bool.random()) {}
            }
        }
        .listStyle(.plain)
    }
}
