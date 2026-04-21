//
//  TabWidget.swift
//  Brief
//
//  Created by rojin on 21.04.2026.
//

import SwiftUI

struct TabWidget: View {
    @State var isActive = true
    var text = "Active"
    var body: some View {
        Text(text)
            .padding()
            .bold()
            .foregroundColor(isActive ?.background :.caption)
            .frame(height: 50)
            .background(isActive ? Color(.active):  Color(.card))
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(isActive ? .clear :Color(.divider),lineWidth: 1 )
            )
    }
}

#Preview {
    TabWidget()
}
