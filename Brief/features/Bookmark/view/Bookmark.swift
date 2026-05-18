//
//  Bookmark.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct Bookmark: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("RECENTLY SAVED")
                    .foregroundColor(.textTertiary)
                    .padding(.vertical,12)
                LazyVStack{
                    ForEach(ArticleList.mockArticle.indices, id: \.self) { index in
                        let item = ArticleList.mockArticle[index]

                        HStack {
                            AsyncImageView(image: item.image)
                            VStack (alignment: .leading){
                                HStack{
                                    Text(item.source.name)
                                    Spacer()
                                    Text(item.publishedAt.timeAgo())
                                }
                                .foregroundColor(.textTertiary)

                                Text(item.title)
                                    .lineLimit(2)
                            }
                        }.padding()
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
    Bookmark()
}
