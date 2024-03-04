//
//  VideoPlayerHelper.swift
//  Animal
//
//  Created by Rupesh Mishra on 20/02/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormate: String)-> AVPlayer
{
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormate)
    {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer ?? AVPlayer()
}
