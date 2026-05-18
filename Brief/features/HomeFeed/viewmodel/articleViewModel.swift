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
    var selectedCategory:String = "General"
    

    func getTopHeadlines() async{
        do{
            articles = try await ArticleService.shared.getTopHeadlines()

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
}
