//
//  SearchBar.swift
//  Brief
//
//  Created by rojin on 18.05.2026.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @FocusState private var searchFocus: Bool
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(AppColor.textSecondary)
            TextField("Topics, articles, or keywords", text: $text)
                .foregroundColor(AppColor.textPrimary)
                .focused($searchFocus)
                .submitLabel(.search)
                .onChange(of: text) { oldValue, newValue in
                    print("🔵 SearchBar onChange — old: '\(oldValue)' → new: '\(newValue)'")
                }
                .onSubmit {
                    print("🟢 SearchBar onSubmit — current text: '\(text)'")
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
        }
        .padding()
        .background(AppColor.surface)
        .cornerRadius(12)
        .contentShape(Rectangle())
        .onTapGesture {
            print("👆 SearchBar tapped — forcing focus")
            searchFocus = true
        }
        .onAppear {
            print("🟡 SearchBar appeared — initial text: '\(text)'")
        }
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
