//
//  ExternalWebLinkView.swift
//  Animal
//
//  Created by Rupesh Mishra on 01/03/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group{
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
            }//: HSTACK
        }//: GROUPBOX
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    return ExternalWebLinkView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
