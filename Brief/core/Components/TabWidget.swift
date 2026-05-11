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
            .foregroundColor(isActive ?AppColor.backgroundPrimary:AppColor.backgroundSecondary)
            .frame(height: 50)
            .background(isActive ? AppColor.accentPrimary: AppColor.accentSecondary )
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(isActive ? .clear :AppColor.borderDefault,lineWidth: 1 )
            )
    }
}

#Preview {
    TabWidget()
}
