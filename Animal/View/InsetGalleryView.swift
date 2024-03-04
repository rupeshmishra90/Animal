//
//  InsetGalleryView.swift
//  Animal
//
//  Created by Rupesh Mishra on 28/02/24.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self){item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                }
            }//: H STACK
        }//: SCROLL VIEW
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    return InsetGalleryView(animal: animals[0])
}
