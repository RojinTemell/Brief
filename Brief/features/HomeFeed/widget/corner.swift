//
//  corner.swift
//  Brief
//
//  Created by rojin on 6.05.2026.
//

import SwiftUI

struct RoundedCorner :Shape {
    var radius: CGFloat = 8
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect)-> Path{
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
