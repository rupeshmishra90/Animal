//
//  MotionAnimationView.swift
//  Animal
//
//  Created by Rupesh Mishra on 04/03/24.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    //MARK: - FUNCTIONS
    //MARK:- FUNCTIONS
    
    //1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat)-> CGFloat
    {
        return CGFloat.random(in: 0...max)
    }
    //2. RANDOM SIZE
    func randomSize()-> CGFloat
    {
        return CGFloat(Int.random(in: 0...300))
    }
    //3. RANDOM SCALE
    func randomScale()-> CGFloat
    {
        return Double.random(in: 0.1...2.0)
    }
    //4. RANDOM SPEED
    func randomSpeed()-> Double
    {
        return Double.random(in: 0.025...1)
    }
    //5. RANDOM DELAY
    func randomDelay()-> Double
    {
        return Double.random(in: 0...2)
    }
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0 ... randomCircle , id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: self.randomCoordinate(max: geometry.size.width),
                            y: self.randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            , value: isAnimating
                        )
                        .onAppear {
                            isAnimating = true
                        }
                    
                }//: LOOP
                
            }//: ZSTACK
            .drawingGroup()
        }//: GEOMETRYREADER

    }
}

#Preview {
    MotionAnimationView()
}
