//
//  LocationModel.swift
//  AnimalsInAfrica
//
//  Created by Rupesh Mishra on 03/03/23.
//

import Foundation
import MapKit
struct NationalParkLocation: Codable, Identifiable{
    let id : String
        let name : String
        let image : String
        let latitude : Double
        let longitude : Double
    
    //Computed property
    
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
