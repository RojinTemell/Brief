//
//  ServiceUrl.swift
//  Brief
//
//  Created by rojin on 4.05.2026.
//
import SwiftUI

enum AppServiceUrl{
    case search(query: String)
    case topHeadlines(country: String, lang: String)
    case category(type: String)
    case custom(query: String, sort: String, fromDate: String)
    

    private var baseUrl:String {
        return "https://gnews.io/api/v4"
    }

    private var path:String{
        switch self {
        case .search ,.custom:
            return "/search"
        case .topHeadlines, .category:
            return "/top-headlines"
        }
    }

    private func apiKey() throws -> String {
        try APIConfig.apiKey()
    }


    var url :URL?{
        guard let apiKey = try? APIConfig.apiKey() else {
            return nil
        }
        var components = URLComponents(string: baseUrl + path)
        var queryItems:[URLQueryItem] = [
            URLQueryItem(name: "apikey", value:apiKey),
            URLQueryItem(name:  "max", value: "10")
        ]

        switch self {
        case .search(let query):
            queryItems.append(URLQueryItem(name: "q", value: query))
            queryItems.append(URLQueryItem(name: "lang", value: "tr"))
        case .topHeadlines(let country, let lang):
            queryItems.append(URLQueryItem(name: "country", value: country))
            queryItems.append(URLQueryItem(name: "lang", value: lang))

        case .category(let type):
            queryItems.append(URLQueryItem(name: "category", value: type))
            queryItems.append(URLQueryItem(name: "lang", value: "tr"))
        case .custom(let query, let sort, let date):
            queryItems.append(contentsOf: [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "sortby", value: sort),
                URLQueryItem(name: "from", value: date)
            ])

        }
        components?.queryItems = queryItems
        return components?.url
    }
}
