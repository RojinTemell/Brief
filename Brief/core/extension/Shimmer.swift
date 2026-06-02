//
//  Shimmer.swift
//  Brief
//
//  Created by rojin on 2.06.2026.
//

import SwiftUI

extension View {
    @ViewBuilder
    func shimmer(active: Bool) -> some View {
        if active {
            self.modifier(ShimmerModifier())
        } else {
            self
        }
    }
}

struct ShimmerModifier : ViewModifier {
    @State private var phase: CGFloat = 0
    func body(content:Content) -> some View {
        content.overlay(
            GeometryReader { geometry in
                LinearGradient(
                    colors: [.clear, .white.opacity(0.5), .clear],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .offset(x: -geometry.size.width + (geometry.size.width * 2 * phase))
                .onAppear {
                    withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                        phase = 1
                    }
                }
            }
        )
        .mask(content)
    }
}
