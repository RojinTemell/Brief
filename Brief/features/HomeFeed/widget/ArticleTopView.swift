//
//  ArticleTopView.swift
//  Brief
//
//  Created by rojin on 11.05.2026.
//

import SwiftUI

struct ArticleTopView: View {
    let article :Article
    var body: some View {
        VStack(alignment: .leading,spacing: 12) {
            AsyncImage(url: URL(string: article.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(
                        maxWidth:.infinity,
                        maxHeight:  180
                    )
                    .clipped()
                    .clipShape(
                        .rect(
                            topLeadingRadius: 16,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 16
                        )
                    )
            } placeholder: {
                ProgressView()
            }
            .clipped()
            .clipShape(
                .rect(
                    topLeadingRadius: 16,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 16
                )
            )
            HStack(){
                Text(article.source.name.uppercased())
                Text("•")
                Text("\(article.publishedAt.timeAgo())")
            }
            .padding(.horizontal,16)
            .font(AppTypography.caption)
            .foregroundColor(AppColor.textSecondary)
            VStack(alignment: .leading,spacing: 8){
                Text(article.title)
                    .lineLimit(3)
                    .foregroundColor(AppColor.textPrimary)
                    .font(AppTypography.title1)

                Text(article.description)
                    .lineLimit(2)
                    .foregroundColor(AppColor.textSecondary)
                    .font(AppTypography.bodyMedium)
            }
            .padding(.horizontal,16)

            HStack{
                Text(article.source.name)
                    .foregroundColor(AppColor.textPrimary)
                    .fontWeight(.bold)
                    .font(AppTypography.caption)

                Spacer()
                Image(systemName: "bookmark")
                    .foregroundStyle(AppColor.textSecondary)

            }
            .padding(.horizontal, 16)
            .padding(.bottom, 12)
        }
        .background(AppColor.backgroundSecondary)
        .cornerRadius(16)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ArticleTopView(article: ArticleList.mockArticle[0])
}
