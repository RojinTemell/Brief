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

    func navigate(to route: AppRoute) {
        switch selectedTab {
        case .home:     home.append(route)
        case .explore:  explore.append(route)
        case .bookmark: bookmark.append(route)
        case .profile:  profile.append(route)
        }
    }


}

enum AppTab {
    case home
    case explore
    case bookmark
    case profile
}
enum AppRoute: Hashable {
    case detail(article: Article)

}

