//
//  TimeExt.swift
//  Brief
//
//  Created by rojin on 18.05.2026.
//

import Foundation
extension String {
    func timeAgo () -> String{
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: self) else {
            return "-"
        }
        let relative = RelativeDateTimeFormatter()
        relative.unitsStyle = .abbreviated
        return relative.localizedString(for: date, relativeTo: Date())
    }
}
