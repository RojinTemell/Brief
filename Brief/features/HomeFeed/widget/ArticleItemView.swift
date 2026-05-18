//
//  ArticleItemView.swift
//  Brief
//
//  Created by rojin on 12.05.2026.
//

import SwiftUI

struct ArticleItemView: View {
    let article:Article
    var body: some View {
        VStack(alignment:.leading,spacing: 12){
            HStack(){
                HStack{
                    Text("Climate")
                        .bold()
                        .font(AppTypography.subheadline)
                    Text(article.publishedAt.timeAgo())
                        .font(AppTypography.caption)
                }
                .foregroundColor(AppColor.textSecondary)
                Spacer()
                Image(systemName: "bookmark")
            }
            HStack{
                VStack(alignment: .leading,spacing: 8){
                    Text(article.title)
                        .font(AppTypography.title2)
                        .fontWeight(.bold)
                        .lineLimit(1)
                    Text(article.description)
                        .font(AppTypography.title3)
                        .fontWeight(.light)
                        .lineLimit(2)
                    Text(article.source.name)
                        .foregroundColor(AppColor.textSecondary)
                        .font(AppTypography.subheadline)
                }

                Spacer()
                AsyncImageView(image: article.image)
            }

        }
        .padding(.vertical,16)

    }
}

#Preview {
    ArticleItemView(article: ArticleList.mockArticle[0])
}
