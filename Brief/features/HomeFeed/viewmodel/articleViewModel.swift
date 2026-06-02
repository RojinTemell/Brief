//
//  articleViewModel.swift
//  Brief
//
//  Created by rojin on 4.05.2026.
//

import SwiftUI
import Observation

@Observable
final class ArticleViewModel {

    private let articleService: ArticleServiceProtocol

    var articles :[Article] = []
    var topHeadlinesArticles:[Article] = []
    var topArticle = ArticleList.mockArticle.first
    var searchArticles :[Article] = []
    var selectedCategory:String = "General"
    private var lastQuery: String = ""
    var searchText: String = ""

    //State
    var topHeadlinesState: HomeState = .idle
    var categoryState:    HomeState = .idle
    var searchState:      HomeState = .idle
    private var searchTask:Task<Void,Never>?


    init(articleService: ArticleServiceProtocol = ArticleService()) {
        self.articleService = articleService
    }

    func getTopHeadlines() async{
        topHeadlinesState = .loading
        do{
            topHeadlinesArticles = try await articleService.getTopHeadlines()
            topArticle = topHeadlinesArticles.first
            topHeadlinesState = topHeadlinesArticles.isEmpty ? .empty : .loaded

        }
        catch{
            topHeadlinesState = .error
            print(error)
        }
    }
    func category(category:String) async{
        categoryState = .loading
        do{
            articles = try await articleService.category(type:category.lowercased())
            selectedCategory = category
            categoryState = articles.isEmpty ? .empty : .loaded
        }
        catch{
            categoryState = .error
            print(error)
        }
    }
    func search(query:String)async{
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)

        // 1. boşsa temizleme işlemi
        guard !trimmed.isEmpty else{
            searchArticles = []
            lastQuery = ""
            searchTask?.cancel()
            searchState = .idle
            return
        }
        //2. aynı query ise tekrar istek atma
        guard trimmed != lastQuery else { return }
        searchState = .loading
        lastQuery = trimmed
        searchTask?.cancel()
        searchTask = Task{
            try? await Task.sleep(nanoseconds: 300_000_000)
            if Task.isCancelled { return }
            do{
                let result = try await articleService.search(query: trimmed)
                if Task.isCancelled { return }
                searchArticles = result
                searchState = result.isEmpty ? .empty : .loaded
            }
            catch {
                searchState = .error
                print(error)
            }
        }


    }
}
