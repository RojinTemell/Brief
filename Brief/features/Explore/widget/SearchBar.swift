//
//  SearchBar.swift
//  Brief
//
//  Created by rojin on 18.05.2026.
//

import SwiftUI

struct SearchBar: View {
    @State private var search: String = ""
    @FocusState private var searchFocus:Bool
    var body: some View {
        HStack{

            Image(systemName: "magnifyingglass")
                .foregroundColor(AppColor.textSecondary)
            TextField("Topics, articles, or keywords",
                      text: $search
            )
            .focused($searchFocus)
            .onSubmit {
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
        }.padding()
            .background(AppColor.surface)
            .cornerRadius(12)
    }
}

#Preview {
    SearchBar()
}
