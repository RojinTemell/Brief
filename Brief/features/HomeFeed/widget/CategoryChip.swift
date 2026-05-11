//
//  CategoryChip.swift
//  Brief
//
//  Created by rojin on 11.05.2026.
//

import SwiftUI

struct CategoryChip: View {
    let title :String
    let action: () -> Void
    let isSelected:Bool
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(isSelected ? AppColor.textInverse:AppColor.textTertiary)
                .bold()
                .padding(.horizontal,18)
                .padding(.vertical,12)
                .background(isSelected ?AppColor.textPrimary:AppColor.backgroundSecondary)
                .cornerRadius(24)
        }

    }
}

#Preview {
    CategoryChip(title: "For You", action: {},isSelected: false)
}
