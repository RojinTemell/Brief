//
//  HomeFlow.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct HomeFlow: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.home){
            HomeFeed()
                .navigationDestination(for: AppRoute.self){ route in
                    switch route{
                    case .detail(let article):
                        ArticleDetail(article: article)
                    }
                }
        }
        .tabItem{ Label("Home",systemImage: "house")}
        .tag(AppTab.home)

    }
}

#Preview {
    HomeFlow().environment(AppRouter())
}
