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
    var articles :[Article] = []
    var topHeadlinesArticles:[Article] = []
    var topArticle = ArticleList.mockArticle[0]
    var searchArticles :[Article] = []
    var selectedCategory:String = "General"

    private var searchTask:Task<Void,Never>?
    private var lastQuery: String = ""
    var searchText: String = ""


    func getTopHeadlines() async{
        do{
            topHeadlinesArticles = try await ArticleService.shared.getTopHeadlines()
            topArticle = topHeadlinesArticles[0]

        }
        catch{
            print(error)
        }
    }
    func category(category:String) async{
        do{
            articles = try await ArticleService.shared.category(type:category.lowercased())
            selectedCategory = category
        }
        catch{
            print(error)
        }
    }
    func search(query:String)async{
        print(query)
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        // 1. boşsa temizleme işlemi
        guard !trimmed.isEmpty else{
            searchArticles = []
            lastQuery = ""
            searchTask?.cancel()
            return
        }
        //2. aynı query ise tekrar istek atma
        guard trimmed != lastQuery else { return }
        lastQuery = trimmed
        searchTask?.cancel()
        searchTask = Task{
            try? await Task.sleep(nanoseconds: 300_000_000)
            if Task.isCancelled { return }
            do{
                let result = try await ArticleService.shared.search(query: trimmed)
                if Task.isCancelled { return }
                searchArticles = result
            }
            catch {
                print(error)
            }
        }


    }
}
