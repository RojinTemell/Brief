//
//  Bookmark.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct Bookmark: View {
    @Environment(AppRouter.self) private var router
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading){
                Text("RECENTLY SAVED")
                    .foregroundColor(.textTertiary)
                    .padding(.vertical,12)
                bookmarkList
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)

        }
        .navigationTitle("BookMark")
    }
}

private extension Bookmark {
    @ViewBuilder
    var bookmarkList : some View {
        LazyVStack{
            ForEach(ArticleList.mockArticle.indices, id: \.self) { index in
                let item = ArticleList.mockArticle[index]

                BookMarkCard(article: item)
                    .onTapGesture {
                        router.navigate(to: .detail(article: item))
                    }

            }
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    Bookmark().environment(AppRouter())
}
