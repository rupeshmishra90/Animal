//
//  MapView.swift
//  Animal
//
//  Created by Rupesh Mishra on 20/02/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json") ?? []
    //MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            //(A) PIN: OLD STYLE ALWAYS STATIC
            //            MapPin(coordinate: item.location, tint: .accentColor)
            //(B) PIN: NEW STYLE ALWAYS STATIC
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            //(C) CUSTOM BASIC ANNOTATION (it could be interactive)
            //            MapAnnotation(coordinate: item.location) {
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32, height: 32, alignment: .center)
            //            }//: ANNOTATION
            
            //(C) CUSTOM ADVANCED ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }
        )//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }//: HSTACK
                    
                    Divider()
                        HStack{
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }//: HSTACK
                    
                }//: VSTACK
                
            }//: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(content: {
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                })
                .padding()
            , alignment: .top
        )
    }
}

#Preview {
    MapView()
}
