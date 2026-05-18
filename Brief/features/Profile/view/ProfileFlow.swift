//
//  ProfileFlow.swift
//  Brief
//
//  Created by rojin on 5.05.2026.
//

import SwiftUI

struct ProfileFlow: View {
    @Environment(AppRouter.self) private var router
    var body: some View {
        @Bindable var router = router
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
    ProfileFlow().environment(AppRouter())
}
