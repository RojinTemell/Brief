//
//  Category.swift
//  Brief
//
//  Created by rojin on 11.05.2026.
//

import SwiftUI

struct Category : Hashable ,Identifiable {
    let id = UUID()
    let title :String
    let imageName :String
    /// Asset olmadığı durumda gösterilecek SF Symbol.
    let systemImage :String

    init(
        title: String,
        imageName: String = "",
        systemImage: String = "square.grid.2x2.fill"
    ) {
        self.title = title
        self.imageName = imageName
        self.systemImage = systemImage
    }
}

struct CategoryList {
    static let mockCatgory = [
        Category(title: "General",
                 imageName: "General",
                 systemImage: "square.grid.2x2.fill"),
        Category(title: "Health",
                 imageName: "Health",
                 systemImage: "heart.fill"),
        Category(title: "Technology",
                 imageName: "Technology",
                 systemImage: "laptopcomputer"),
        Category(title: "Word",
                 imageName: "Word",
                 systemImage: "globe"),
        Category(title: "Nation",
                 imageName: "Nation",
                 systemImage: "flag.fill"),
        Category(title: "Business",
                 imageName: "Business",
                 systemImage: "briefcase.fill"),
        Category(title: "Entertainment",
                 imageName: "Entertainment",
                 systemImage: "film.fill"),
        Category(title: "Sports",
                 imageName: "Sports",
                 systemImage: "sportscourt.fill"),
        Category(title: "Science",
                 imageName: "Science",
                 systemImage: "atom"),
    ]
}
