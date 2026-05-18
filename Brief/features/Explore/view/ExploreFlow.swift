//
//  ExploreFlow.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct ExploreFlow: View {
    @Environment(AppRouter.self) private var router
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.explore){
            Explore()
        }.tabItem(){
            Label("Explore",systemImage: "magnifyingglass.circle.fill")
        }
        .tag(AppTab.explore)
    }
}

#Preview {
    ExploreFlow().environment(AppRouter())
}
