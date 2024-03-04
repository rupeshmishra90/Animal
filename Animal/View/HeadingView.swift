//
//  HeadingView.swift
//  Animal
//
//  Created by Rupesh Mishra on 28/02/24.
//

import SwiftUI

struct HeadingView: View {
    //MARK: - PROPERTIES
    var headingImage: String
    var headingText: String
    //MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }//: HSTACK
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
        .previewLayout(.sizeThatFits)
        .padding()
}
