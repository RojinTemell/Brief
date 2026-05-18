//
//  Explore.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct Explore: View {
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),

    ]


    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 12){
                SearchBar()
                Text("TOP CATEGORIES")
                    .foregroundColor(.textTertiary)
                    .padding(.vertical,12)
                LazyVGrid(columns: columns){
                    ForEach(CategoryList.mockCatgory.prefix(4)){ catgegory in
                        Text(catgegory.title)
                            .frame(width: 180,height: 180)
                            .background(AppColor.accentSecondary)
                            .cornerRadius(8)

                    }
                }
            }
        }.padding()
    }
}

#Preview {
    Explore()
}
