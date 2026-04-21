//
//  BriefListTile.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct BriefListTile: View {
    // bu kısımda veriler iin model parametre olarak yönlendirilecek
    let title :String = "Fed Signals Rate Hold Through Q3 as Inflation Cools"
    let name :String = "Reuters"
    let time :Int = 8
    let image :String = "bookPlaceholder"

    var body: some View {
        HStack(alignment: .top){
            Text("2")
                .foregroundColor(.caption)
            VStack(alignment: .leading){
                Text(title)
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                HStack{
                    Text(name)
                    Text("•")
                    Text("\(time)m ago")
                } .foregroundColor(.caption)
            }
            .padding(.horizontal,24)
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 65,height: 65)
                .cornerRadius(8)

        }
        .frame(maxWidth: .infinity,maxHeight:160)
        .background(Color(.black))



    }
}

#Preview {
    BriefListTile()
}
