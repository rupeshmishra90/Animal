//
//  AnimalsView.swift
//  Animal
//
//  Created by Rupesh Mishra on 20/02/24.
//

import SwiftUI

struct AnimalsView: View {
    //MARK: - PROPERTY
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    @State private var isGridViewActive: Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    //MARK: - BODY
    var body: some View {
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals){ animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }//: List
                }else{
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: LINK
                            }
                        }//: GRID
                    }//: SCROLL
                }
            }//: GROUP
            .navigationTitle("Animals")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    HStack(spacing: 16){
                        HStack(spacing: 16){
                            //LIST
                            Button() {
                                isGridViewActive = false
                                haptics.impactOccurred()
                                print("List view is activated")
                            } label: {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .primary : .accentColor)
                            }
                            //GRID
                            Button() {
                                isGridViewActive = true
                                haptics.impactOccurred()
                                print("Grid view is activated")
                            } label: {
                                Image(systemName: "square.grid.2x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                            }
                        }//: HSTACK
                    }//: HSTACK
                }
            }
        }//: NAVIGATION
    }
}

#Preview {
    AnimalsView()
}
