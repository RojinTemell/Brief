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

    func navigateInHome(to route: HomeRoute) {
        home.append(route)
    }

}

enum AppTab {
    case home
    case explore
    case bookmark
    case profile
}
enum HomeRoute     : Hashable{
    case detail(article:Article)
}
enum ExploreRoute  : Hashable{}
enum BookmarkRoute : Hashable{}
enum ProfileRoute  : Hashable{}

