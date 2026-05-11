//
//  ArticleTopView.swift
//  Brief
//
//  Created by rojin on 11.05.2026.
//

import SwiftUI

struct ArticleTopView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 12) {
            Image("topNew")
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .clipped()
                .clipShape(
                    .rect(
                        topLeadingRadius: 16,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 16
                    )
                )

            HStack(){
                Text("GLOBAL ECONOMICS")
                Text("•")
                Text("12 Min Read")
            }
            .padding(.horizontal,16)
            .font(AppTypography.caption)
            .foregroundColor(AppColor.textSecondary)
            VStack(alignment: .leading,spacing: 8){
                Text("The Future of Decentralized Finance in Emerging Markets")
                    .foregroundColor(AppColor.textPrimary)
                    .font(AppTypography.title1)

                Text("An in-depth exploration of how digital currencies are reshaping the financial…")
                    .foregroundColor(AppColor.textSecondary)
                    .font(AppTypography.bodyMedium)
            }
            .padding(.horizontal,16)

            HStack{
                Text("The Daily Journal")
                    .foregroundColor(AppColor.textPrimary)
                    .fontWeight(.bold)
                    .font(AppTypography.caption)

                Spacer()
                Image(systemName: "bookmark")
                    .foregroundStyle(AppColor.textSecondary)

            }
            .padding(.horizontal, 16)
            .padding(.bottom, 12)
        }
        .background(AppColor.backgroundSecondary)
        .cornerRadius(16)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ArticleTopView()
}
