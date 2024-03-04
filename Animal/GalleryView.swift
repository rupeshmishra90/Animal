//
//  GalleryView.swift
//  Animal
//
//  Created by Rupesh Mishra on 20/02/24.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal: String = "lion"
    //DYNAMIC GRID DEFINITION
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColom: Double = 3.0
    //MARK: - GRID SWITCH
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColom))
    }
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30){
                //MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                //MARK: - SLIDER
                Slider(value: $gridColom, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColom) { oldValue, newValue in
                        gridSwitch()
                    }
                //MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }//: GESTURE
                    }//: LOOP
                }//: GRID
                .animation(.easeIn, value: 1)
                .onAppear{
                    gridSwitch()
                }
            }//: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: SCROLLVIEW
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
