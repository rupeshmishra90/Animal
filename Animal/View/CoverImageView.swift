//
//  CoverImageView.swift
//  Animal
//
//  Created by Rupesh Mishra on 20/02/24.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json") ?? []
    //MARK: - BODY
    var body: some View {
        TabView{
            ForEach(coverImages){ item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: Loop
        }//: TabView
        .tabViewStyle(.page)
    }
}
//MARK: - PREVIEW
#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
