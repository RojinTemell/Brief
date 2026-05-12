//
//  ArticleItemView.swift
//  Brief
//
//  Created by rojin on 12.05.2026.
//

import SwiftUI

struct ArticleItemView: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 12){
            HStack(){
                HStack{
                    Text("Climate")
                        .bold()
                        .font(AppTypography.subheadline)
                    Text("4h ago")
                        .font(AppTypography.caption)
                }
                .foregroundColor(AppColor.textSecondary)
                Spacer()
                Image(systemName: "bookmark")
            }
            HStack{
                VStack(alignment: .leading,spacing: 8){
                    Text("New architectural standards for flood-resistant cities.")
                        .font(AppTypography.title2)
                        .fontWeight(.light)
                    Text("Urban Review")
                        .foregroundColor(AppColor.textSecondary)
                        .font(AppTypography.subheadline)
                }
                Spacer()
                Image("topNew")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90,height: 90)
                    .clipped()
                    .cornerRadius(16)

            }

        }
//        .background(AppColor.backgroundSecondary)
        .padding(.vertical,16)

    }
}

#Preview {
    ArticleItemView()
}
