//
//  ContentView.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct ContentView: View {
    @State var app = AppRouter()
    var body: some View {
        TabView(selection: $app.selectedTab) {
            HomeFlow()
            ExploreFlow()
            BookmarkFlow()
            ProfileFlow()
        }
    }
}

#Preview {
    ContentView()
}
