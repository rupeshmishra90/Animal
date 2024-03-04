//
//  InsertMapView.swift
//  Animal
//
//  Created by Rupesh Mishra on 01/03/24.
//

import SwiftUI
import MapKit

struct InsertMapView: View {
    //MARK:- PROPERTIES
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    //MARK:- BODY
    var body: some View {
        
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack{
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }//: H STACK
                    .padding(.vertical, 8)
                    .padding(.horizontal, 14)
                    .background {
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    }
                }//: NAVIGATIONLINK
                    .padding(12)
                    , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

#Preview {
    InsertMapView()
        .previewLayout(.sizeThatFits)
        .padding()
}
