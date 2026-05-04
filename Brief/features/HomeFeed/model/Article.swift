//
//  Article.swift
//  Brief
//
//  Created by rojin on 4.05.2026.
//

import SwiftUI

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article :Codable{
    let id :String
    let title:String
    let description:String
    let content:String
    let url:String
    let image:String
    let publishedAt:String
    let lang:String
    let source:Source
}

struct Source :Codable{
    let id:String
    let name:String
    let url:String
    let country:String
}
