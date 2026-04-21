//
//  HomeFeed.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct HomeFeed: View {
    var body: some View {
        HStack(spacing: 12) {
            Color.secondary.opacity(0.3)
                .frame(height: 1)
            Text("TODAY")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .fixedSize()
            Color.secondary.opacity(0.3)
                .frame(height: 1)
        }
        .padding(.vertical,8)
    }
}

#Preview {
    HomeFeed()
}
