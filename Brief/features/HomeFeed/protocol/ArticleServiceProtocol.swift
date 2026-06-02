//
//  HomeProtocol.swift
//  Brief
//
//  Created by rojin on 2.06.2026.
//

import Foundation

protocol ArticleServiceProtocol {
    func getTopHeadlines () async throws ->[Article]
    func search(query:String) async throws ->[Article]
    func category(type:String) async throws ->[Article]
    func filter(query:String,sortBy:String,fromDate:String)async throws ->[Article]

}
