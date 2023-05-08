//
//  OnboardingView.swift
//  Restart
//
//  Created by realxnesia on 12/04/23.
//

import SwiftUI

struct OnboardingView: View {
  @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0 // merepresentasikan nilai asset untuk horizontal asset
  // ketika di drag nilainya akan berubah.
  @State private var isAnimating: Bool = false
  @State private var imageOffset: CGSize = .zero
  @State private var inidcatorOpacity: Double = 1.0
  
  
  @State private var textTitle: String = "Share."
  
  var body: some View {
    ZStack {
      Color("ColorBlue") // add background color
        .ignoresSafeArea(.all, edges: .all)
      VStack(spacing: 20) {
        // MARK: - Header
        Spacer()
        VStack(spacing: 0) {
          Text(textTitle)
            .font(.system(size: 60))
            .fontWeight(.heavy) //bold
            .foregroundColor(.white) //textColor
            .transition(.opacity)
          Text(
                        """
                        It's not how much we give but
                        how much love we put into giving.
                        """
          )
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 10)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40) // mengubah arah animasinya dari atas ke bawah.
        .animation(
          .easeOut(duration: 1),
          value: isAnimating
        )
        
        
        
        // MARK: - Content
        ZStack {
          CircleGroupView(
            ShapeColor: .white,
            ShapeOppacity: 0.2
          )
          // paralaxm effect
          .offset(x: imageOffset.width * -1) // dikali -1 untuk menciptakan efek berlawanan arah
          .blur(radius: abs(imageOffset.width / 5)) // abs untuk mengilangkan value negative
          .animation(.easeOut(duration: 1), value: imageOffset)
          
          Image("character-1")
            .resizable()
            .scaledToFit()
          //animation
            .opacity(isAnimating ? 1 : 0)
            .animation(
              .easeOut(duration: 0.5),
              value: isAnimating
            )
          //paralax animation
            .offset(
              x: imageOffset.width * 1.2, //accelerate movement
              y: 0
            )
            .rotationEffect(.degrees(Double(imageOffset.width / 20)))
            .gesture(
              DragGesture()
                .onChanged { gesture in
                  if abs(imageOffset.width) <= 150 {
                    imageOffset = gesture.translation
                    withAnimation(.linear(duration: 0.25)) {
                      inidcatorOpacity = 0
                      textTitle = "Give."
                    }
                  }
                }
                .onEnded({ _ in
                  imageOffset = .zero
                  withAnimation(.linear(duration: 0.25)) {
                    inidcatorOpacity = 1
                    textTitle = "Share."
                  }
                })
            )
            .animation(.easeOut(duration: 1), value: imageOffset)
        }
        .overlay(
          Image(systemName: "arrow.left.and.right.circle")
            .font(.system(size: 44, weight: .ultraLight))
            .foregroundColor(.white)
            .offset(y: 20)
          //animation
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
            .opacity(inidcatorOpacity)          ,
          alignment: .bottom
        )
        Spacer()
        
        // MARK: Footer
        ZStack {
          // (todo: Parts of the custom Button)
          
          // 1. Background(Static)
          Capsule()
            .fill(Color.white.opacity(0.2)) // warna samar
          Capsule()
            .fill(Color.white.opacity(0.2))
            .padding(8)
          
          // 2. Call to Action
          Text("Get Started")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .offset(x: 20)
          
          // 3. Capsule (Dynamic Width)
          HStack {
            Capsule()
              .fill(Color("ColorRed"))
              .frame(width: buttonOffset + 80)
            Spacer()
          }
          
          // 4. Circle (Dragable)
          HStack {
            ZStack {
              Circle()
                .fill(Color("ColorRed"))
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              Image(systemName: "chevron.right.2")
                .font(.system(size: 24, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .offset(x: buttonOffset) // otomatis update
            .gesture(
              DragGesture()
                .onChanged { gesture in
                  if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                    buttonOffset = gesture.translation.width
                  }
                }
                .onEnded({ _ in
                  // Animation
                  withAnimation(Animation.easeOut(duration: 0.8)) {
                    if buttonOffset > buttonWidth / 2 {
                      buttonOffset = buttonWidth - 80
                      isOnBoardingViewActive = false
                    } else {
                      buttonOffset = 0
                    }
                  }
                })
            )
            
            Spacer()
          }
        }
        .frame(
          width: buttonWidth,
          height: 80,
          alignment: .center
        )
        .padding()
        //animation
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40)
        .animation(
          .easeOut(duration: 0.5),
          value: isAnimating
        )
      }
    }
    .onAppear {
      isAnimating = true
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
