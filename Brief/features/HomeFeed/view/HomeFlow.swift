//
//  HomeFlow.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct HomeFlow: View {
    @State private var router = AppRouter()
    
    var body: some View {
        NavigationStack(path: $router.home){
            HomeFeed()
//                .navigationDestination(for: HomeRoute.self){
//
//                }
        }
        .tabItem{ Label("Home",systemImage: "house")}
        .tag(AppTab.home)

    }
}

#Preview {
    HomeFlow()
}
