//
//  HomeFeed.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct HomeFeed: View {
    var body: some View {
        VStack(spacing: 12) {
            Image("topNew")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .aspectRatio(contentMode: .fill)
                .clipped()
                .clipShape(
                    .rect(
                        topLeadingRadius: 16,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 16
                    )
                )
            HStack{
                Text("GLOBAL ECONOMICS")
                Image(systemName: "smallcircle.filled.circle.fill")
                Text("12 Min Read")
            }
            Text("The Future of Decentralized Finance in Emerging Markets")

            Text("An in-depth exploration of how digital currencies are reshaping the financial…")
            HStack{
                Text("The Daily Journal")
               Spacer()
                Image(systemName: "bookmark")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .padding(.all,25)
    }
}

#Preview {
    HomeFeed()
}
