////
////  CircleButton.swift
////  Brief
////
////  Created by rojin on 21.04.2026.
////
//
//import SwiftUI
//
////Duruma göre extension ile status ayarlanabilir color için
//struct CircleButton: View {
//    let systemName:String
//    var body: some View {
//        Button( role: {}){
//            Image(systemName:systemName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
//                .frame(width:20,height: 20)
//                .padding(.all,8)
//                .background(Color(.active))
//                .clipShape(Circle())
//                .overlay(
//                    Circle()
//                        .stroke(.active, lineWidth: 2)
//                )
//        }
//    }
//}
//
//#Preview {
//    CircleButton(systemName: "bookmark")
//}
