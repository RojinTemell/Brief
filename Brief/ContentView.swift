//
//  ContentView.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(AppRouter.self) private var app
    var body: some View {
        @Bindable var app = app
        TabView(selection: $app.selectedTab) {
            HomeFlow()
            ExploreFlow()
            BookmarkFlow()
            ProfileFlow()
        }
    }
}

#Preview {
    ContentView().environment(AppRouter())
}
