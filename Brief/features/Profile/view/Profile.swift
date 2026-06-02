//
//  Profile.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("Personal Information")
                        .foregroundColor(AppColor.textPrimary)
                        .font(AppTypography.headline)
                        .fontWeight(.light)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(AppColor.textTertiary)

                }
                .padding(.horizontal,12)
                .frame(height: 80)
                .border(AppColor.borderDefault)
                .cornerRadius(8)
                .background(AppColor.backgroundSecondary)

            }
            .padding()
        }
    }
}

#Preview {
    Profile()
}
