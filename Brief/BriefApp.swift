//
//  BriefApp.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

@main
struct BriefApp: App {
    @State private var themeManager = ThemeManager()
    @State private var appRouter = AppRouter()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(themeManager)
                .environment(appRouter) 
        }
    }
}
