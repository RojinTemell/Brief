//
//  CategoryCard.swift
//  Brief
//
//  Created by rojin on 19.05.2026.
//

import SwiftUI

struct CategoryCard: View {
    let category: Category
    var size: CGFloat = 180

    /// Asset Catalog'da imageName ile bir resim bulunup bulunmadığını kontrol eder.
    private var hasAssetImage: Bool {
        !category.imageName.isEmpty && UIImage(named: category.imageName) != nil
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if hasAssetImage {
                Image(category.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipped()
            } else {
                ZStack {
                    AppColor.accentSecondary
                    Image(systemName: category.systemImage)
                        .font(.system(size: size * 0.35, weight: .semibold))
                        .foregroundColor(AppColor.textInverse.opacity(0.85))
                }
                .frame(width: size, height: size)
            }

            LinearGradient(
                colors: [Color.black.opacity(0.0), Color.black.opacity(0.55)],
                startPoint: .center,
                endPoint: .bottom
            )
            .frame(width: size, height: size)

            Text(category.title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(12)
        }
        .frame(width: size, height: size)
        .cornerRadius(8)
    }
}

#Preview {
    HStack {
        CategoryCard(category: CategoryList.mockCatgory[1]) // Health
        CategoryCard(category: CategoryList.mockCatgory[2]) // Technology
    }
    .padding()
}
