//
//  ArticleService.swift
//  Brief
//
//  Created by rojin on 4.05.2026.
//

import SwiftUI
import Observation

final class ArticleService : ArticleServiceProtocol{
    static  let shared = ArticleService()
    func getTopHeadlines()async throws ->[Article]{
        guard let url = AppServiceUrl.topHeadlines(country: "tr",lang:"tr").url else {

            throw AppError.InvalidUrl
        }
        let (data, response) = try await URLSession.shared.data(for:URLRequest(url: url))

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw AppError.InvalidUrl
        }

        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(NewsResponse.self, from: data)
            return result.articles
        }catch {
            print("Decode error: \(error)")
            throw AppError.InvalidData
        }
    }

    func search(query:String) async throws ->[Article] {
        guard let url = AppServiceUrl.search(query: query).url else {
            throw AppError.InvalidUrl
        }
        
        print(url)
        let (data,response) = try await URLSession.shared.data(for: URLRequest(url: url))

        guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else{
            throw AppError.InvalidUrl
        }
        do {
            let  decoder = JSONDecoder()
            let result = try decoder.decode(NewsResponse.self, from: data)
            return result.articles
        }catch {
            throw AppError.InvalidData
        }
    }

    func category(type:String) async throws ->[Article] {
        guard let url = AppServiceUrl.category(type: type).url else{
            throw  AppError.InvalidUrl
        }
        print(url)
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url:url))

        guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {
            throw AppError.InvalidResponse
        }
        do{
            let  decoder = JSONDecoder()
            let  result = try decoder.decode(NewsResponse.self, from: data)
            return result.articles

        }catch{
            throw AppError.InvalidData
        }

    }

    func filter(query:String,sortBy:String,fromDate:String)async throws ->[Article]{
        guard let url = AppServiceUrl.custom(query: query, sort: sortBy, fromDate: fromDate).url else{
            throw AppError.InvalidUrl
        }
        let (data, response) = try await  URLSession.shared.data(for: URLRequest(url:url))

        guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {
            throw AppError.InvalidResponse
        }
        do{
            let decoder = JSONDecoder()
            let result = try decoder.decode(NewsResponse.self, from: data)
            return result.articles

        }catch{
            throw AppError.InvalidData
        }
    }
}


