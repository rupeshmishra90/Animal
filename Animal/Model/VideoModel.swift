//
//  VideoModel.swift
//  AnimalsInAfrica
//
//  Created by Rupesh Mishra on 03/03/23.
//

import Foundation
struct Video: Codable, Identifiable{
    let id : String
    let name : String
    let headline: String
    
    //Computed property
    var thumbnail: String{
        "video-\(id)"
    }
}
