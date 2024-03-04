//
//  VideoListItemView.swift
//  Animal
//
//  Created by Rupesh Mishra on 20/02/24.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - PROPERTIES
    let video: Video
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 10){
            ZStack{
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(10)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .cornerRadius(5)
            }//: ZSTACK
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VSTACK
        }//: HSTACK
    }
}

#Preview {
    let videos: [Video] = Bundle.main.decode("videos.json") ?? []
    return VideoListItemView(video: videos[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
