//
//  InsetFactView.swift
//  Animal
//
//  Created by Rupesh Mishra on 28/02/24.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TABVIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 146, idealHeight: 168, maxHeight: 180)
        }//: GROUPBOX
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    return InsetFactView(animal: animals[0])
}
