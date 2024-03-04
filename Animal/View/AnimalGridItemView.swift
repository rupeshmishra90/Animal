//
//  AnimalGridItemView.swift
//  Animal
//
//  Created by Rupesh Mishra on 28/02/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    return AnimalGridItemView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
