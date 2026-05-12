//
//  HomeFeed.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct HomeFeed: View {

    var body: some View {
        ScrollView{
            VStack{
                ArticleTopView()
                Spacer().frame(height: 24)
                ScrollView{
                    HStack{
                        ForEach(CategoryList.mockCatgory, id: \.self){ item in
                            CategoryChip(title: item.title,
                                         action: { },
                                         isSelected: item.isSelected
                            )

                        }
                    }
                }
                ScrollView{
                    VStack{
                        ForEach(0...3, id: \.self){ _ in
                            ArticleItemView()

                        }
                    }
                }.padding(.all,20)




            }

        }


    }
}

#Preview {
    HomeFeed()
}
