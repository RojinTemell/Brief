//
//  ProfileFlow.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct ProfileFlow: View {
    @State private var router = AppRouter()
    var body: some View {
        NavigationStack(path: $router.profile){
            Profile()
        }
        .tabItem(){
            Label("Profile",systemImage: "person.crop.circle.fill")
        }
        .tag(AppTab.profile)
    }
}

#Preview {
    ProfileFlow()
}
