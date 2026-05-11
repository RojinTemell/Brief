//
//  ThemeManager.swift
//  Brief
//
//  Created by rojin on 11.05.2026.
//
import SwiftUI

enum ThemeMode {
    case light
    case dark
}

extension ThemeManager {

    var theme: any AppTheme {
        currentTheme
    }
}

@Observable
final class ThemeManager {

    private(set) var currentTheme : AppTheme
    private(set) var currentMode : ThemeMode

    init(mode: ThemeMode = .light){
        self.currentMode = mode
        switch mode  {
        case .light:
            self.currentTheme = LightTheme()
        case .dark :
            self.currentTheme = DarkTheme()

        }

    }
    func setTheme(_ mode: ThemeMode) {

        currentMode = mode

        switch mode {

        case .light:
            currentTheme = LightTheme()

        case .dark:
            currentTheme = DarkTheme()
        }
    }
    func toggleTheme() {

        switch currentMode {

        case .light:
            setTheme(.dark)

        case .dark:
            setTheme(.light)
        }
    }

}
