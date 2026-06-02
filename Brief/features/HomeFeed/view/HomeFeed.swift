//
//  HomeFeed.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct HomeFeed: View {
    @Environment(AppRouter.self) private var router
    @State private var viewmodel = ArticleViewModel()

    var body: some View {
        ScrollView {
            LazyVStack {
                topHeadlinesSection

                Spacer().frame(height: 24)
                categorySection
                articleListSection
            }
        }
        .task {
            await viewmodel.getTopHeadlines()
            await viewmodel.category(category: viewmodel.selectedCategory)
        }
    }
}


private extension HomeFeed {
    @ViewBuilder
    var topHeadlinesSection: some View {
        switch viewmodel.topHeadlinesState {
        case .idle, .loading:
            ArticleTopView(article: ArticleList.mockArticle.first!)
                .redacted(reason: .placeholder)
                .shimmer(active: true)

        case .empty:
            Text("No top story available")
                .foregroundColor(.textTertiary)
                .padding(.top, 40)

        case .error:
            VStack(spacing: 8) {
                Text("Couldn't load top headlines")
                    .foregroundColor(.textSecondary)
                Button("Retry") {
                    Task { await viewmodel.getTopHeadlines() }
                }
            }
            .padding(.top, 40)

        case .loaded:
            if let top = viewmodel.topArticle {
                ArticleTopView(article: top)
                    .onTapGesture {
                        router.navigate(to: .detail(article: top))
                    }
            }
        }
    }

    var categorySection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(CategoryList.mockCatgory, id: \.self) { item in
                    CategoryChip(
                        category: item,
                        action: {
                            await viewmodel.category(category: item.title)
                        },
                        selectedCategory: $viewmodel.selectedCategory
                    )
                }
            }
            .padding(.horizontal, 16)
        }
    }

    @ViewBuilder
    var articleListSection: some View {
        LazyVStack(spacing: 16) {
            switch viewmodel.categoryState {
            case .idle, .loading:
                ForEach(ArticleList.mockArticle) { item in
                    ArticleItemView(article: item)
                        .redacted(reason: .placeholder)
                        .shimmer(active: true)
                }

            case .empty:
                Text("No articles in this category")
                    .foregroundColor(.textTertiary)
                    .padding(.top, 40)

            case .error:
                VStack(spacing: 8) {
                    Text("Couldn't load articles")
                        .foregroundColor(.textSecondary)
                    Button("Retry") {
                        Task { await viewmodel.category(category: viewmodel.selectedCategory) }
                    }
                }
                .padding(.top, 40)

            case .loaded:
                ForEach(viewmodel.articles) { item in
                    ArticleItemView(article: item)
                        .onTapGesture {
                            router.navigate(to: .detail(article: item))
                        }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    HomeFeed().environment(AppRouter())
}
