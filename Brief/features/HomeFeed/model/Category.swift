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
        Category(title: "For You", isSelected: true),
        Category(title: "Politics", isSelected: false),
        Category(title: "Technology", isSelected: false)
    ]
}
