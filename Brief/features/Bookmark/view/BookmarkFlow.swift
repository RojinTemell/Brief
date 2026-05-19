//
//  BookmarkFlow.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct BookmarkFlow: View {
    @Environment(AppRouter.self) private var router
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.bookmark){
            Bookmark()
                .navigationDestination(for: AppRoute.self){ route in
                    switch route{
                    case .detail(let article):
                        ArticleDetail(article: article)

                    }

                }
        }
        .tabItem(){
            Label("Bookmark",systemImage: "bookmark.circle.fill")
        }
        .tag(AppTab.bookmark)
    }
}

#Preview {
    BookmarkFlow().environment(AppRouter())
}
