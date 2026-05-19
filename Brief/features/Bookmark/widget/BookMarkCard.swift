//
//  BookMarkCard.swift
//  Brief
//
//  Created by rojin on 19.05.2026.
//

import SwiftUI

struct BookMarkCard: View {
    var article:Article
    var body: some View {
        HStack {
            AsyncImageView(image: article.image)
            VStack (alignment: .leading){
                HStack{
                    Text(article.source.name)
                    Spacer()
                    Text(article.publishedAt.timeAgo())
                }
                .foregroundColor(.textTertiary)

                Text(article.title)
                    .lineLimit(2)
            }
        }.padding()
    }
}

#Preview {
    BookMarkCard(article: ArticleList.mockArticle[0])
}
