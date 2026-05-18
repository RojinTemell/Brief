//
//  CategoryChip.swift
//  Brief
//
//  Created by rojin on 11.05.2026.
//

import SwiftUI

struct CategoryChip: View {
    let category :Category
    let action: ()  async -> Void
    @Binding var selectedCategory: String
    var isSelected: Bool {
        selectedCategory == category.title
    }

    var body: some View {
        Button{
            Task {
                await action()
            }
        }label: {
            Text(category.title)
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
    CategoryChip(category: CategoryList.mockCatgory[0], action: {},selectedCategory: .constant("General"))
}
