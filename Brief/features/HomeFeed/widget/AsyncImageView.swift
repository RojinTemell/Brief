//
//  AsyncImageView.swift
//  Brief
//
//  Created by rojin on 18.05.2026.
//

import SwiftUI

struct AsyncImageView: View {
    let image :String
    let corner:Double
    let width :CGFloat?
    let height:CGFloat?

    init(
        image: String,
        corner: Double = 16,
        width: CGFloat = 100,
        height: CGFloat = 100
    ) {
        self.image = image
        self.corner = corner
        self.width = width
        self.height = height
    }

    var body: some View {
        AsyncImage(url: URL(string: image)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(
                    maxWidth: width == nil ? .infinity : width,
                    maxHeight: height
                )
                .clipped()
                .cornerRadius(corner )
        } placeholder: {
            ProgressView()
        }
        .clipped()
        .cornerRadius(corner )
    }
}

#Preview {
    AsyncImageView(image:ArticleList.mockArticle[0].image)
}
