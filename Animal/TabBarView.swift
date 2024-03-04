//
//  TabBarView.swift
//  Animal
//
//  Created by Rupesh Mishra on 20/02/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            AnimalsView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }
    }
}

#Preview {
    TabBarView()
}
