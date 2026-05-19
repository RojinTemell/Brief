//
//  Explore.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct Explore: View {
    @Environment(AppRouter.self) private var router
    @State  private var viewmodel = ArticleViewModel()
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),

    ]
    var body: some View {
        @Bindable var vm = viewmodel
        ScrollView{
            VStack(alignment: .leading,spacing: 12){
                SearchBar(text: $vm.searchText)
                    .onChange(of: viewmodel.searchText)  {_, newValue in
                        print("🟣 Explore onChange — newValue: '\(newValue)'")
                        Task {
                            await viewmodel.search(query: newValue)
                        }
                    }
                Text("TOP CATEGORIES")
                    .foregroundColor(.textTertiary)
                    .padding(.vertical,12)
                LazyVGrid(columns: columns){
                    ForEach(CategoryList.mockCatgory.prefix(4)){ catgegory in
                        CategoryCard(category: catgegory)
                    }
                }
                LazyVStack{
                    ForEach(viewmodel.searchArticles){ article in
                        ArticleItemView(article: article)
                            .onTapGesture {
                                router.navigate(to: .detail(article: article))
                            }
                    }
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .padding()
    }
}

#Preview {
    Explore().environment(AppRouter())
}
