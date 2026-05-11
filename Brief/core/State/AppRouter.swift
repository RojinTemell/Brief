//
//  appState.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI
import Observation

@Observable
final class AppRouter {
    var selectedTab :AppTab = .home
    var home                = NavigationPath()
    var explore             = NavigationPath()
    var bookmark            = NavigationPath()
    var profile             = NavigationPath()
}

enum AppTab {
    case home
    case explore
    case bookmark
    case profile
}
enum HomeRoute     : Hashable{}
enum ExploreRoute  : Hashable{}
enum BookmarkRoute : Hashable{}
enum ProfileRoute  : Hashable{}

