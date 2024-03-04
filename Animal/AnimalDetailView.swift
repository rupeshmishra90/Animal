//
//  AnimalDetailView.swift
//  Animal
//
//  Created by Rupesh Mishra on 28/02/24.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            // HERO IMAGE
            VStack(alignment: .center, spacing: 20) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding(.vertical, 8)
                    .background {
                        Color.accentColor
                            .frame(height: 5)
                            .offset(y: 24)
                    }
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accent)
                    .padding(.horizontal)
                //GALLERY
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                //FACTS
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                //DESCRIPTION
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                //MAP
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsertMapView()
                }
                //LINK
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                .padding(.horizontal)
            }//: VSTACK
        }
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    return AnimalDetailView(animal: animals[0])
}
