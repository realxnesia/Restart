//
//  CircleGroupView.swift
//  Restart
//
//  Created by realxnesia on 13/04/23.
//

import SwiftUI

struct CircleGroupView: View {
    @State var ShapeColor: Color // State merupakan property wrapper untuk read and write
    @State var ShapeOppacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    ShapeColor.opacity(ShapeOppacity),
                    lineWidth: 40
                )
                .frame(
                    width: 260,
                    height: 260,
                    alignment: .center
                )
            Circle()
                .stroke(
                    ShapeColor.opacity(ShapeOppacity),
                    lineWidth: 80
                )
                .frame(
                    width: 260,
                    height: 260,
                    alignment: .center
                )
        }
        // Animation Blur and Scale Effect
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(
            Animation.easeOut(duration: 0.5),
            value: isAnimating
        )
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all)
            CircleGroupView(
                ShapeColor: .white,
                ShapeOppacity: 0.2
            )
        }
    }
}
