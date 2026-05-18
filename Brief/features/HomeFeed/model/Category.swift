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
    let isSelected :Bool

}

struct CategoryList {
    static let mockCatgory = [
        Category(title: "General", isSelected: true),
        Category(title: "Health", isSelected: false),
        Category(title: "Technology", isSelected: false),
        Category(title: "Word", isSelected: false),
        Category(title: "Nation", isSelected: false),
        Category(title: "Business", isSelected: false),
        Category(title: "Entertainment", isSelected: false),
        Category(title: "Sports", isSelected: false),
        Category(title: "Science", isSelected: false),
    ]
}
