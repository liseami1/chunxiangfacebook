//
//  HomeView.swift
//  PureFantasy
//
//  Created by 赵翔宇 on 2023/1/19.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel = .init()
    var body: some View {
        NavigationView {
            List {
                ForEach(HomeViewModel.Members.allCases, id: \.hashValue) { member in
                    NavigationLink {
                        member.profile
                    } label: {
                        Text("\(member.name)")
                    }
                }
            }
            .navigationTitle(Text("纯想学员主页展览"))
            .toolbar {}
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
