//
//  HomeFeed.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct HomeFeed: View {
    @Environment(AppRouter.self) private var router
    @State private var  viewmodel = ArticleViewModel()

    var body: some View {
        ScrollView{
            VStack{
                ArticleTopView()
                    .onTapGesture {
                        router.navigateInHome(to: .detail(article: ArticleList.mockArticle[0]))
                    }

                Spacer().frame(height: 24)
                categorySection
                articleListSection
            }
        }
        .task  {
            await viewmodel.getTopHeadlines()
        }
    }
}


private extension HomeFeed{
    var categorySection:some View {

        ScrollView(.horizontal, showsIndicators: false){

            LazyHStack(spacing: 12){
                ForEach(CategoryList.mockCatgory, id: \.self){ item in
                    CategoryChip(
                        category: item,
                        action: {
                            await viewmodel.category(category: item.title)
                        },
                        selectedCategory: $viewmodel.selectedCategory
                    )
                }
            }
            .padding(.horizontal,16)
        }
    }

    var articleListSection :some View{
        LazyVStack(spacing: 16){
            ForEach(viewmodel.articles){ item in
                ArticleItemView(article: item)
                    .onTapGesture {
                        router.navigateInHome(to: .detail(article: item))
                    }
            }
        }
        .padding(.horizontal,16)
    }
}

#Preview {
    HomeFeed().environment(AppRouter())
}
