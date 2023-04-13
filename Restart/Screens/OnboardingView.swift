//
//  OnboardingView.swift
//  Restart
//
//  Created by realxnesia on 12/04/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            Color("ColorBlue") // add background color
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: - Header
                Spacer()
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy) //bold
                        .foregroundColor(.white) //textColor
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
                // MARK: - Content
                ZStack {
                    ZStack {
                        Circle()
                            .stroke(
                                .white.opacity(0.2),
                                lineWidth: 40
                            )
                            .frame(
                                width: 260,
                                height: 260,
                                alignment: .center
                            )
                        Circle()
                            .stroke(
                                .white.opacity(0.2),
                                lineWidth: 80
                            )
                            .frame(
                                width: 260,
                                height: 260,
                                alignment: .center
                            )
                    }
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
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
                            .frame(width: 80)
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
                        .onTapGesture {
                            isOnBoardingViewActive = false
                        }
                        
                        Spacer()
                    }
                }
                .frame(height: 80, alignment: .center)
                .padding()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
