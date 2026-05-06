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

    func getTopHeadlines() async{
        do{
            articles = try await ArticleService.shared.getTopHeadlines()
            print(articles.count)
        }
        catch{
            print(error)
        }
    }
}
