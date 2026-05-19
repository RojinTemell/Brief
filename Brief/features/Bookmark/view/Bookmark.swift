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
            VStack(alignment: .leading){
                Text("RECENTLY SAVED")
                    .foregroundColor(.textTertiary)
                    .padding(.vertical,12)
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
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)

        }
        .navigationTitle("BookMark")
    }
}

#Preview {
    Bookmark().environment(AppRouter())
}
