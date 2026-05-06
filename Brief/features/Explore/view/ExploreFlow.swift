//
//  ExploreFlow.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct ExploreFlow: View {
    @State private var router = AppRouter()
    var body: some View {
        NavigationStack(path: $router.explore){
            Explore()
        }.tabItem(){
            Label("Explore",systemImage: "magnifyingglass.circle.fill")
        }
        .tag(AppTab.explore)
    }
}

#Preview {
    ExploreFlow()
}
