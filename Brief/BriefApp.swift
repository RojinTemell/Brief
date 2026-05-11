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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(themeManager)
        }
    }
}
