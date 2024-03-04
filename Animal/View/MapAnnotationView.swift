//
//  MapAnnotationView.swift
//  Animal
//
//  Created by Rupesh Mishra on 20/02/24.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK: - PROPERTIES
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    //MARK: - BODY
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 53, alignment: .center)
                .scaleEffect(1 + animation)
                .opacity(1 - animation)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }//: ZSTACK
        .onAppear{
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

#Preview {
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json") ?? []
    return MapAnnotationView(location: locations[0])
}
