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
