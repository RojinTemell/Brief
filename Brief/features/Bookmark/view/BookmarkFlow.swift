//
//  BookmarkFlow.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct BookmarkFlow: View {
    @State private var router = AppRouter()
    var body: some View {
        NavigationStack(path: $router.bookmark){
            Bookmark()
        }
        .tabItem(){
            Label("Bookmark",systemImage: "bookmark.circle.fill")
        }
        .tag(AppTab.bookmark)
    }
}

#Preview {
    BookmarkFlow()
}
