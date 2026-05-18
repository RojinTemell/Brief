//
//  ArticleDetail.swift
//  Brief
//
//  Created by rojin on 18.05.2026.
//

import SwiftUI

struct ArticleDetail: View {
    let article:Article
    @Environment(\.openURL) var openURL
    var body: some View {
        ScrollView{
            VStack{
                AsyncImageView(image:article.image,corner: 0,width: .infinity,height: 200)
                VStack(alignment: .leading,spacing: 12){

                    HStack(){
                        Text(article.publishedAt.timeAgo())
                        Spacer()
                        Text(article.source.name)
                    }
                    .font(AppTypography.footnote)
                    .foregroundColor(.textTertiary)
                    Text(article.title)
                        .font(.editTitle(size: 32))

                    Text(article.description)
                        .font(AppTypography.headline)

                    Text(article.content)
                        .font(AppTypography.callout)
                        .foregroundColor(.textTertiary)
                }
                .padding()
                Button{
                    if let url =  URL(string: article.url) {
                        openURL(url)
                    }
                }label:{
                    Text("Go To Detail")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(AppColor.accentPrimary)
                .controlSize(.large)
                .padding()
            }
        }
        .navigationTitle(article.source.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    print("Button tapped")
                } label: {
                    Image(systemName: "bookmark")
                        .foregroundColor(AppColor.accentPrimary)
                }
            }
        }
    }
}

#Preview {
    ArticleDetail(article: ArticleList.mockArticle[0])
}
