//
//  AppBar.swift
//  Brief
//
//  Created by rojin on 18.05.2026.
//

import SwiftUI
struct AppBar <Leading:View, Trailing: View>:View{

    let title:String
    let leading:Leading
    let trailing:Trailing

    init(
        title: String,
        @ViewBuilder leading:() -> Leading,
        @ViewBuilder  trailing:( ) -> Trailing) {
            self.title = title
            self.leading = leading()
            self.trailing = trailing()
        }

    var body: some View {
        HStack {
            leading
            Spacer()
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)

            Spacer()
            trailing
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
//        .background(.ultraThinMaterial)
    }
}
