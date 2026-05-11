//
//  AppTypography.swift
//  Brief
//
//  Created by rojin on 11.05.2026.
//

import SwiftUI

enum AppTypography {

    static let largeTitle = Font.system(size: 34, weight: .bold)

    static let title1 = Font.system(size: 28, weight: .bold)

    static let title2 = Font.system(size: 22, weight: .semibold)

    static let title3 = Font.system(size: 20, weight: .semibold)

    static let headline = Font.system(size: 17, weight: .semibold)

    static let body = Font.system(size: 16, weight: .regular)

    static let bodyMedium = Font.system(size: 16, weight: .medium)

    static let callout = Font.system(size: 15)

    static let subheadline = Font.system(size: 14)

    static let footnote = Font.system(size: 13)

    static let caption = Font.system(size: 12)
}


extension Font {
    static func editTitle(size: CGFloat ) -> Font{
        .custom("NewYorkLarge-Bold", size: size)
    }
}
