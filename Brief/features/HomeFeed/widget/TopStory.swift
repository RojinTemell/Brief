//
//  TopStory.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct TopStory: View {
    let text:String = "AI Models Reshape Global Finance as 2025 Forecasts Surge"
    let name = "Bloomberg"
    let duration = 4
    let time = 2
    var body: some View {
        VStack(alignment: .leading
        ,spacing: 12){
            HStack(){
                TabWidget(isActive: true)
                Spacer()
                CircleButton(systemName: "CircleButton")
            }
            Spacer()
            Text(text)
                .font(.title2)
                .fontWeight(.semibold)
                .lineSpacing(4)
                .foregroundColor(.headline)
            Spacer().frame(height: 20)
            HStack(spacing: 6,){
                Text(name)
                Text("•")
                Text("\(duration) min read")
                Text("•")
                Text("\(time)m ago")

            }.foregroundColor(.caption)
        }
        .padding(.all,24)
        .frame(maxWidth: .infinity,maxHeight:300)
        .background(
            LinearGradient(colors: [Color.brown.opacity(0.99), Color.black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .cornerRadius(12)
        .padding(.horizontal,16)

    }
}

#Preview {
    TopStory()
}
