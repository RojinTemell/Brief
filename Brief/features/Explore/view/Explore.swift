//
//  Explore.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct Explore: View {
    @Environment(AppRouter.self) private var router
    @State private var viewmodel = ArticleViewModel()
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
    ]

    var body: some View {
        @Bindable var vm = viewmodel
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                SearchBar(text: $vm.searchText)
                    .onChange(of: viewmodel.searchText) { _, newValue in
                        Task {
                            await viewmodel.search(query: newValue)
                        }
                    }

                Text("TOP CATEGORIES")
                    .foregroundColor(.textTertiary)
                    .padding(.vertical, 12)

                LazyVGrid(columns: columns) {
                    ForEach(CategoryList.mockCatgory.prefix(4)) { catgegory in
                        CategoryCard(category: catgegory)
                    }
                }

                searchResultsSection
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .padding()
    }
}

private extension Explore {
    @ViewBuilder
    var searchResultsSection: some View {
        switch viewmodel.searchState {
        case .idle:
            EmptyView()

        case .loading:
            ForEach(0..<5, id: \.self) { _ in
                ArticleItemView(article: ArticleList.mockArticle.first!)
                    .redacted(reason: .placeholder)
                    .shimmer(active: true)
            }

        case .empty:
            Text("No results for \"\(viewmodel.searchText)\"")
                .foregroundColor(.textTertiary)
                .frame(maxWidth: .infinity)
                .padding(.top, 40)

        case .error:
            VStack(spacing: 8) {
                Text("Search failed")
                    .foregroundColor(.textSecondary)
                Button("Retry") {
                    Task { await viewmodel.search(query: viewmodel.searchText) }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 40)

        case .loaded:
            ForEach(viewmodel.searchArticles) { article in
                ArticleItemView(article: article)
                    .onTapGesture {
                        router.navigate(to: .detail(article: article))
                    }
            }
        }
    }
}

#Preview {
    Explore().environment(AppRouter())
}
